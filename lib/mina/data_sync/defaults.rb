set_default :database_path, "config/database.yml"
set_default :backup_path, '.'
set_default :backup_file, -> { "backup-#{Date.today}.tar" }
set_default :pg_options, "-O -Ft -a"
