set :database_path, 'config/database.yml'
set :remote_backup_path, 'tmp'
set :local_backup_path, -> { ENV['DATA_SYNC_BACKUP_PATH'] || 'tmp' }
set :backup_file, -> { %{#{fetch(:repository).split('/').last.split('.').first}-#{fetch(:rails_env)}-#{Date.today}.sql} }
