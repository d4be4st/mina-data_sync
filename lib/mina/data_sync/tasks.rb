namespace :data_sync do
  set :term_mode, :pretty

  desc "pull"
  task :pg_pull => :environment do
    queue "echo '-----> Dumping database'"
    queue "#{DATABASE_CONF}"
    queue "cd #{deploy_to}/#{current_path}"
    queue "ARGS=$(database_conf #{database_path} #{rails_env})"
    queue! "pg_dump $ARGS #{pg_options} --clean > #{backup_file}"

    to :after_hook do
      queue "echo '-----> Copying backup'"
      queue "#{DATABASE_CONF}"
      queue "ARGS=$(database_conf #{database_path} development)"
      queue! "scp -P #{port} #{user}@#{domain}:#{deploy_to}/#{current_path}/#{backup_file} #{backup_path}/#{backup_file}"
      queue "echo '-----> Restoring database'"
      queue! "pg_restore $ARGS #{pg_options} --clean #{backup_path}/#{backup_file}"
    end
  end

  desc "push"
  task :pg_push => :environment do
    to :before_hook do
      queue "#{DATABASE_CONF}"
      queue "echo '-----> Dumping database'"
      queue "ARGS=$(database_conf #{database_path} development)"
      queue! "pg_dump $ARGS #{pg_options} --clean > #{backup_file}"
      queue "echo '-----> Copying backup'"
      queue! "scp -P #{port} #{backup_file} #{user}@#{domain}:#{deploy_to}/#{current_path}/#{backup_file}"
    end

    queue "echo '-----> Restoring database'"
    queue "#{DATABASE_CONF}"
    queue "cd #{deploy_to}/#{current_path}"
    queue "ARGS=$(database_conf #{database_path} #{rails_env})"
    queue! "pg_restore $ARGS #{pg_options} --clean #{backup_file}"
  end
end
