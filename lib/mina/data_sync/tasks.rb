namespace :data_sync do
  task setup_sync: :environment do
    read_conf(database_path, rails_env)
  end

  task pull: :setup_sync do
    run :remote do
      comment 'Dumping database'
      command "cd #{fetch(:current_path)}"
      command "#{DATA_SYNC}"
      command "mkdir -p #{fetch(:remote_backup_path)}"
      command "CONFIG=$(#{fetch(:rails)} runner 'puts ActiveRecord::Base.connection.instance_variable_get(:@config).to_json')"
      command %(data_sync "dump" "#{fetch(:remote_backup_path)}/#{fetch(:backup_file)}" "$CONFIG")
      command %(eval $(data_sync "dump" "#{fetch(:remote_backup_path)}/#{fetch(:backup_file)}" "$CONFIG"))
    end if fetch(:dump_data) == 'true'

    run :local do
      if fetch(:dump_data) == 'true'
        comment 'Copying backup'
        command "mkdir -p #{fetch(:local_backup_path)}"
        command "rsync --progress -e 'ssh -p #{fetch(:port)}' #{fetch(:user)}@#{fetch(:domain)}:#{fetch(:current_path)}/#{fetch(:remote_backup_path)}/#{fetch(:backup_file)} #{fetch(:local_backup_path)}/#{fetch(:backup_file)}"
      end
      if fetch(:restore_data) == 'true'
        comment 'Restoring database'
        command "#{DATA_SYNC}"
        command "CONFIG=$(RAILS_ENV=development #{fetch(:bundle_bin)} exec rails runner 'puts ActiveRecord::Base.connection.instance_variable_get(:@config).to_json')"
        command %(data_sync "restore" "#{fetch(:local_backup_path)}/#{fetch(:backup_file)}" "$CONFIG")
        command %(eval $(data_sync "restore" "#{fetch(:local_backup_path)}/#{fetch(:backup_file)}" "$CONFIG"))
      end
    end
  end

  task push: :setup_sync do
    run :local do
      comment 'Dumping database'
      command "#{DATA_SYNC}"
      command "CONFIG=$(RAILS_ENV=development #{fetch(:bundle_bin)} exec rails runner 'puts ActiveRecord::Base.connection.instance_variable_get(:@config).to_json')"
      command %(data_sync "dump" "#{fetch(:local_backup_path)}/#{fetch(:backup_file)}" "$CONFIG")
      command %(eval $(data_sync "dump" "#{fetch(:local_backup_path)}/#{fetch(:backup_file)}" "$CONFIG"))
      comment 'Copying backup'
      command "rsync --progress -e 'ssh -p #{fetch(:port)}' #{fetch(:local_backup_path)}/#{fetch(:backup_file)} #{fetch(:user)}@#{fetch(:domain)}:#{fetch(:current_path)}/#{fetch(:remote_backup_path)}/#{fetch(:backup_file)}"
    end if fetch(:dump_data) == 'true'

    run :remote do
      comment 'Restoring database'
      command "cd #{fetch(:current_path)}"
      command "#{DATA_SYNC}"
      command "CONFIG=$(#{fetch(:rails)} runner 'puts ActiveRecord::Base.connection.instance_variable_get(:@config).to_json')"
      command %(data_sync "restore" "#{fetch(:remote_backup_path)}/#{fetch(:backup_file)}" "$CONFIG")
      command %(eval $(data_sync "restore" "#{fetch(:remote_backup_path)}/#{fetch(:backup_file)}" "$CONFIG"))
    end if fetch(:restore_data) == 'true'
  end
end
