set_default :database_path, "config/database.yml"
set_default :remote_backup_path, 'tmp'
set_default :local_backup_path, { ENV['DATA_SYNC_BACKUP_PATH'] || 'tmp/backups' }
set_default :restore_data, -> { ENV['restore'] || 'true' }
