set :database_path, 'config/database.yml'
set :remote_backup_path, 'tmp'
set :local_backup_path, -> { ENV['DATA_SYNC_BACKUP_PATH'] || 'tmp' }
set :restore_data, -> { ENV['restore'] || 'true' }
set :dump_data, -> { ENV['dump'] || 'true' }
