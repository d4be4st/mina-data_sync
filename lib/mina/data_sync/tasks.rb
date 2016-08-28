namespace :data_sync do
  task :remote_dump do
    run :remote do
      dump_restore(fetch(:current_path), fetch(:remote_backup_path), mode: :dump, backend: :remote)
    end
  end

  task :local_dump do
    run :local do
      dump_restore('.', fetch(:local_backup_path), mode: :dump, backend: :local)
    end
  end

  task :copy_local_to_remote do
    rsync_db(mode: :local_to_remote)
  end

  task :copy_remote_to_local do
    rsync_db(mode: :remote_to_local)
  end

  task :remote_restore do
    run :remote do
      dump_restore(fetch(:current_path), fetch(:remote_backup_path), mode: :restore, backend: :remote)
    end
  end

  task :local_restore do
    run :local do
      dump_restore('.', fetch(:local_backup_path), mode: :restore, backend: :local)
    end
  end

  task :pull do
    invoke :'data_sync:remote_dump'
    invoke :'data_sync:copy_remote_to_local'
    invoke :'data_sync:local_restore'
  end

  task :push do
    invoke :'data_sync:local_dump'
    invoke :'data_sync:copy_local_to_remote'
    invoke :'data_sync:remote_restore'
  end
end
