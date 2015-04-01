namespace :data_sync do
  set :term_mode, :pretty

  task setup_sync: :environment do
    read_conf(database_path, rails_env)
  end

  task pull: :setup_sync do
    queue "echo '-----> Dumping database'"
    queue "cd #{deploy_to}/#{current_path}"
    queue! "#{CONF}"
    queue! "ARGS=$(conf #{database_path} #{rails_env})"
    queue "mkdir -p #{remote_backup_path}"
    queue! "#{dump} $ARGS #{options} > #{remote_backup_path}/#{backup_file}"

    to :after_hook do
      queue "echo '-----> Copying backup'"
      queue "#{CONF}"
      queue "ARGS=$(conf #{database_path} development)"
      queue "mkdir -p #{local_backup_path}"
      queue! "scp -P #{port} #{user}@#{domain}:#{deploy_to}/#{current_path}/#{remote_backup_path}/#{backup_file} #{local_backup_path}/#{backup_file}"
      queue "echo '-----> Restoring database'"
      queue! "#{restore} $ARGS < #{local_backup_path}/#{backup_file}"
    end
  end

  task push: :setup_sync do
    to :before_hook do
      queue "#{CONF}"
      queue "echo '-----> Dumping database'"
      queue "ARGS=$(conf #{database_path} development)"
      queue! "#{dump} $ARGS #{options} > #{local_backup_path}/#{backup_file}"
      queue "echo '-----> Copying backup'"
      queue! "scp -P #{port} #{local_backup_path}#{backup_file} #{user}@#{domain}:#{deploy_to}/#{current_path}/#{remote_backup_path}/#{backup_file}"
    end

    queue "echo '-----> Restoring database'"
    queue "cd #{deploy_to}/#{current_path}"
    queue "#{CONF}"
    queue "ARGS=$(conf #{database_path} #{rails_env})"
    queue! "#{restore} $ARGS <  #{remote_backup_file}/#{backup_file}"
  end
end
