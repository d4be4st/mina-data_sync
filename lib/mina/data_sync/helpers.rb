COMMAND = <<-RUBY
  method = ARGV[0]
  dc = JSON.parse(ARGV[2])
  adapter = dc["adapter"]
  database = dc["database"]
  host = dc["host"]
  username = dc["username"]
  password = dc["password"]
  port = dc["port"]
  arguments = ""
  case adapter.to_s
  when "postgresql"
    arguments += "PGPASSWORD=\\"" + password + "\\" " if password
    arguments += method == "dump" ? "pg_dump" : "psql -q"
    arguments += " -d " + database if database
    arguments += " -h " + host if host
    arguments += " -U " + username if username
    arguments += " -p " + port.to_s if port
    arguments += method == "dump" ? " -O -c" : ""
  when "mysql2"
    arguments += method == "dump" ? "mysqldump" : "mysql"
    arguments += " " + database if database
    arguments += " -h " + host if host
    arguments += " -u " + username if username
    arguments += " --password=" + password if password
    arguments += " -P " + port.to_s if port
  end
  arguments += method == "dump" ? " > " : " < "
  arguments += ARGV[1]
  puts arguments
RUBY

DATA_SYNC = <<-BASH
  function data_sync {
    ruby -rjson -e '#{COMMAND}' "$@"
  };
BASH

def dump_restore(rails_root, backup_path, mode: :dump, backend: :local)
  comment %{#{mode == :dump ? 'Dumping' : 'Restoring'} database}
  command %{cd #{rails_root}}
  command DATA_SYNC.to_s
  command %{mkdir -p #{backup_path}}
  command %{CONFIG=$(RAILS_ENV=#{backend == :local ? 'development' : fetch(:rails_env)} bundle exec rails runner "puts ActiveRecord::Base.connection.instance_variable_get(:@config).to_json")}
  comment %{$(data_sync "#{mode}" "#{backup_path}/#{fetch(:backup_file)}" "$CONFIG")}
  command %{eval $(data_sync "#{mode}" "#{backup_path}/#{fetch(:backup_file)}" "$CONFIG")}
end

def rsync_db(mode: :remote_to_local)
  if mode == :remote_to_local
    run :local do
      comment %{Copying backup}
      command %{mkdir -p #{fetch(:local_backup_path)}}
      comment %{Backup: #{fetch(:local_backup_path)}/#{fetch(:backup_file)}}
      command %{rsync --progress -e "ssh -p #{fetch(:port, 22)}" #{fetch(:user)}@#{fetch(:domain)}:#{fetch(:current_path)}/#{fetch(:remote_backup_path)}/#{fetch(:backup_file)} #{fetch(:local_backup_path)}/#{fetch(:backup_file)}}
    end
  else
    run :remote do
      command %{mkdir -p #{fetch(:current_path)}/#{fetch(:remote_backup_path)}}
    end
    run :local do
      comment %{Copying backup}
      comment %{Backup: #{fetch(:remote_backup_path)}/#{fetch(:backup_file)}}
      command %{rsync --progress -e "ssh -p #{fetch(:port, 22)}" #{fetch(:local_backup_path)}/#{fetch(:backup_file)} #{fetch(:user)}@#{fetch(:domain)}:#{fetch(:current_path)}/#{fetch(:remote_backup_path)}/#{fetch(:backup_file)}}
    end
  end
end
