namespace :data_sync do
  task setup_sync: :environment do
    read_conf(database_path, rails_env)
  end

  task pull: :setup_sync do
    set :term_mode, :pretty

    queue "echo '-----> Dumping database'"
    queue "cd #{deploy_to}/#{current_path}"
    queue "#{CONF}"
    queue "ARGS=$(conf #{database_path} #{rails_env})"
    queue "mkdir -p #{remote_backup_path}"
    queue! "echo $ARGS"
    queue! "#{dump} $ARGS #{options} > #{remote_backup_path}/#{backup_file}"

    to :after_hook do
      queue "echo '-----> Copying backup'"
      queue "mkdir -p #{local_backup_path}"
      queue! "rsync --progress -e 'ssh -p #{port}' #{user}@#{domain}:#{deploy_to}/#{current_path}/#{remote_backup_path}/#{backup_file} #{local_backup_path}/#{backup_file}"
      queue "echo '-----> Restoring database'"
      if restore_data == 'true'
        queue "#{CONF}"
        queue "ARGS=$(conf #{database_path} development)"
        queue! "#{restore} $ARGS < #{local_backup_path}/#{backup_file}"
      end
    end
  end

  task push: :setup_sync do
    set :term_mode, :pretty
    
    to :before_hook do
      queue "echo '-----> Dumping database'"
      queue "#{CONF}"
      queue "ARGS=$(conf #{database_path} development)"
      queue! "#{dump} $ARGS #{options} > #{local_backup_path}/#{backup_file}"
      queue "echo '-----> Copying backup'"
      queue! "rsync --progress -e 'ssh -p #{port}' #{local_backup_path}/#{backup_file} #{user}@#{domain}:#{deploy_to}/#{current_path}/#{remote_backup_path}/#{backup_file}"
    end

    if restore_data == 'true'
      queue "echo '-----> Restoring database'"
      queue "cd #{deploy_to}/#{current_path}"
      queue "#{CONF}"
      queue "ARGS=$(conf #{database_path} #{rails_env})"
      queue! "#{restore} $ARGS <  #{deploy_to}/#{current_path}/#{remote_backup_path}/#{backup_file}"
    end
  end
end
