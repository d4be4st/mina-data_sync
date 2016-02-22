namespace :data_sync do
  task setup_sync: :environment do
    read_conf(database_path, rails_env)
  end

  task pull: :setup_sync do
    set :term_mode, :pretty

    queue "echo '-----> Dumping database'"
    queue "cd #{deploy_to}/#{current_path}"
    queue "#{DATA_SYNC}"
    queue "mkdir -p #{remote_backup_path}"
    queue "CONFIG=$(#{rails} runner 'puts ActiveRecord::Base.connection.instance_variable_get(:@config).to_json')"
    queue! %(eval $(data_sync "dump" "#{remote_backup_path}/#{backup_file}" "$CONFIG"))

    to :after_hook do
      queue "echo '-----> Copying backup'"
      queue "mkdir -p #{local_backup_path}"
      queue "#{DATA_SYNC}"
      queue! "rsync --progress -e 'ssh -p #{port}' #{user}@#{domain}:#{deploy_to}/#{current_path}/#{remote_backup_path}/#{backup_file} #{local_backup_path}/#{backup_file}"
      if restore_data == 'true'
        queue "echo '-----> Restoring database'"
        queue "CONFIG=$(#{rails} runner 'puts ActiveRecord::Base.connection.instance_variable_get(:@config).to_json')"
        queue %(data_sync "restore" "#{local_backup_path}/#{backup_file}" "$CONFIG")
      end
    end
  end

  task push: :setup_sync do
    set :term_mode, :pretty

    to :before_hook do
      queue "echo '-----> Dumping database'"
      queue "#{DATA_SYNC}"
      queue "CONFIG=$(#{rails} runner 'puts ActiveRecord::Base.connection.instance_variable_get(:@config).to_json')"
      queue! %(eval $(data_sync "dump" "#{local_backup_path}/#{backup_file}" "$CONFIG"))
      queue "echo '-----> Copying backup'"
      queue! "rsync --progress -e 'ssh -p #{port}' #{local_backup_path}/#{backup_file} #{user}@#{domain}:#{deploy_to}/#{current_path}/#{remote_backup_path}/#{backup_file}"
    end

    if restore_data == 'true'
      queue "echo '-----> Restoring database'"
      queue "cd #{deploy_to}/#{current_path}"
      queue "CONFIG=$(#{rails} runner 'puts ActiveRecord::Base.connection.instance_variable_get(:@config).to_json')"
      queue %(data_sync "restore" "#{remote_backup_path}/#{backup_file}" "$CONFIG")
    end
  end
end
