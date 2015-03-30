lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'pry'
require 'mina/data_sync'
# require 'mina/whenever' # uncomment if using whenever

# Setup project
# - mina production setup
# Deploy project
# - mina production deploy
# Tail log from project
# - mina prodution log
# Pull data from production
# - mina production data:pull

set :repository, 'git@bitbucket.org:infinum_hr/web_miramoclub.git'
set :backup_path, '/Users/stef/dev/databases/pg'
set :port, 22220
set :user, 'staging'
set :domain, 'miramo.infinum.co'

task :production do
  set :deploy_to, '/home/staging/www/m/miramo.infinum.co'
  set :rails_env, 'production'
  set :branch, 'master'
  set :bundle_withouts, 'development:test:staging'
end

# If you have
task :staging do
  set :domain, 'miramo.infinum.co'
  set :deploy_to, '/home/staging/www/m/miramo.infinum.co'
  set :rails_env, 'staging'
  set :branch, 'develop'
  set :bundle_withouts, 'development:test:production'
end

task :development do
  set :rails_env, 'development'
end
##################################################################################
########################## DO NOT EDIT THE CODE BELOW ############################
##################################################################################

# While linking asssets it will only precompile that assets that was changed, not all of them
set :shared_paths, ['log']

task :deploy => :stages do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      # Capistrano to Mina Fix, symlink system to shared
      queue! %[echo "-----> Symlink system to shared"]
      queue! %[ln -nFs #{deploy_to}/shared/system #{deploy_to}/#{current_path}/public/system]

      #invoke :'whenever:update' # uncomment if using whenever (why here? read https://gist.github.com/gabskoro/abfc245a55a9d155f8de)
      invoke :restart_application
    end
  end
end

# First ensure that the stage is selected
task :stages do
  unless domain
    print_error "A server needs to be specified. e.g. production/staging"
    exit
  end
end

# Just overwrote to execute stages first
task :setup => :stages do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]
end

# Tail log from server
task :log => :stages do
  queue "tail -f #{deploy_to}/#{current_path}/log/#{rails_env}.log"
end

# Restart application after deployment
task :restart_application do
  queue %[echo "-----> Restarting application"]
  queue "mkdir -p #{deploy_to}/#{current_path}/tmp"
  queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
end

namespace :data do
  set :pretty_print, true
  set :db_path, '/Users/stef/dev/databases'

  # # Sync database
  # RYAML = <<-BASH
  #   function ryaml {
  #     ruby -ryaml -e 'puts ARGV[1..-1].inject(YAML.load(File.read(ARGV[0]))) {|acc, key| acc[key] }' "$@"
  #   };
  # BASH

  task :pull => :stages do
    queue RYAML
    queue! "HOST=$(ryaml #{deploy_to}/#{current_path}/config/database.yml #{rails_env} host)"
    queue! "DATABASE=$(ryaml #{deploy_to}/#{current_path}/config/database.yml #{rails_env} database)"
    queue! "USERNAME=$(ryaml #{deploy_to}/#{current_path}/config/database.yml #{rails_env} username)"
    queue! "PASSWORD=$(ryaml #{deploy_to}/#{current_path}/config/database.yml #{rails_env} password)"
    queue! "mysqldump $DATABASE --host=$HOST --user=$USERNAME --password=$PASSWORD > #{deploy_to}/dump.sql"
    queue! "gzip -f #{deploy_to}/dump.sql"

    to :after_hook do
      queue! "scp -P #{port} #{user}@#{domain}:#{deploy_to}/dump.sql.gz ."
      queue! "gunzip -f dump.sql.gz"
      queue! "#{RYAML} mysql --verbose --user=$(ryaml config/database.yml development username) --password=$(ryaml config/database.yml development password) $(ryaml config/database.yml development database) < dump.sql"
      queue! "rm dump.sql"
    end
  end
end
