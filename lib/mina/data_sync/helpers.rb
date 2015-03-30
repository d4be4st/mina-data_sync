DC = <<-RUBY
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
    puts arguments
  end
RUBY

DATABASE_CONF = <<-BASH
  function database_conf {
    ruby -ryaml -rerb -e '#{DC}' "$@"
  };
BASH

# module Mina
#   module DataSync
#     class Base
#       def initialize(database_path, rails_env, deploy_to, tar)
#         @database_conf = YAML.load(ERB.new(File.read(database_path)).result)[rails_env]
#         @tar = tar
#         @deploy_to = deploy_to
#       end

#       def database
#         @database_conf['database']
#       end

#       def host
#         @database_conf['host']
#       end

#       def username
#         @database_conf['username']
#       end

#       def port
#         @database_conf['port']
#       end

#       def file_sql
#         @file_sql ||= "backup-#{Date.today}.sql"
#       end

#       def file_tar
#         @file_tar ||= "backup-#{Date.today}.tar"
#       end

#       def file
#         @tar ? file_tar : file_sql
#       end

#       def options
#         options = "-O -a"
#         options += ' -Ft' if @tar
#         options
#       end
#     end
#   end
# end
