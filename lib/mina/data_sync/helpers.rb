ARGUMENTS = <<-RUBY
  dc = YAML.load(ERB.new(File.read(ARGV[0])).result)[ARGV[1]]
  adapter = dc["adapter"]
  database = dc["database"]
  host = dc["host"]
  username = dc["username"]
  password = dc["password"]
  port = dc["port"]
  arguments = ""
  case adapter.to_s
  when "postgresql"
    arguments += " -d " + database if database
    arguments += " -h " + host if host
    arguments += " -U " + username if username
    arguments += " -p " + port.to_s if port
  when "mysql2"
    arguments += " " + database if database
    arguments += " -h " + host if host
    arguments += " -u " + username if username
    arguments += " --password=" + password if password
    arguments += " -P " + port.to_s if port
  end
  puts arguments
RUBY

CONF = <<-BASH
  function conf {
    ruby -ryaml -rerb -e '#{ARGUMENTS}' "$@"
  };
BASH

def read_conf(path, rails_env)
  @conf ||= YAML.load(ERB.new(File.read(path)).result)[rails_env]
end

def backup_file
  "#{@conf['database']}-#{Date.today}.sql"
end

def dump
  case @conf['adapter']
  when 'postgresql' then 'pg_dump'
  when 'mysql2' then 'mysqldump'
  end
end

def restore
  case @conf['adapter']
  when 'postgresql' then 'psql -q'
  when 'mysql2' then 'mysql'
  end
end

def options
  case @conf['adapter']
  when 'postgresql' then '-O -c'
  when 'mysql2' then ''
  end
end
