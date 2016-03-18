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
    arguments += "PGPASSWORD=\"" + password + "\" " if password
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

def config
  "#{rails} runner 'puts ActiveRecord::Base.connection.instance_variable_get(:@config).to_json'"
end

def backup_file
  "#{repository.split('/').last.split('.').first}-#{rails_env}-#{Date.today}.sql"
end
