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
