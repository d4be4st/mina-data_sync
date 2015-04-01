lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/whenever' # uncomment if using whenever
require 'mina/data_sync'


# Setup project
# - mina production setup
# Deploy project
# - mina production deploy
# Tail log from project
# - mina prodution log
# Pull data from production
# - mina production data:pull

set :repository, 'git@bitbucket.org:infinum_hr/web_psylog.git'
set :user, 'legacy'
set :port, 22219

task :production do
  set :domain, 'psylog.eu'
  set :deploy_to, '/home/legacy/www/p/psylog.eu'
  set :rails_env, 'production'
  set :branch, 'master'
end

task :staging do
  set :domain, 'psylog-staging.infinum.co'
  set :deploy_to, '/home/legacy/www/p/psylog-staging.infinum.co'
  set :rails_env, 'staging'
  set :branch, 'master'
end


##################################################################################
########################## DO NOT EDIT THE CODE BELOW ############################
##################################################################################

set :shared_paths, ['log', 'pids']

task :deploy => :stages do
  deploy do
    to :default do
      invoke :'git:clone'
      invoke :'deploy:link_shared_paths'
      invoke :'bundle:install'
      invoke :'rails:db_migrate'
      invoke :'rails:assets_precompile'
      invoke :'deploy:cleanup'
    end

    to :launch do
      # Capistrano to Mina Fix, symlink system to shared
      queue! %[echo "-----> Symlink system to shared"]
      queue! %[ln -nFs #{deploy_to}/shared/system #{deploy_to}/#{current_path}/public/system]

      queue %[echo "-----> Restarting jobs"]
       queue "RAILS_ENV=#{rails_env} #{deploy_to}/#{current_path}/bin/delayed_job restart --pid-dir=pids"

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

  queue! %[mkdir -p "#{deploy_to}/shared/system"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/system"]
end

# Import dummy data
task :import => :stages do
  queue "bundle exec rake import:effects"
  queue "bundle exec rake import:lifestyles"
  queue "bundle exec rake import:medications"
  queue "bundle exec rake import:users"
  queue "bundle exec rake import:friendships"
end

task :import_effects => :stages do
  queue "bundle exec rake import:effects"
end

task :import_lifestyles => :stages do
  queue "bundle exec rake import:lifestyles"
end

task :import_medications => :stages do
  queue "bundle exec rake import:medications"
end

task :import_users => :stages do
  queue "bundle exec rake import:users"
end

task :import_friendships => :stages do
  queue "bundle exec rake import:friendships"
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

# Ping application
task :ping_application do
  queue %[echo "-----> Ping domain"]
  queue %[curl -s #{domain} > /dev/null]
end

# Stop delayed job
task :stop_delayed_job do
  queue! %[echo "-----> Stop delayed job"]
  queue! %[cd #{deploy_to}/#{current_path} ; RAILS_ENV=#{rails_env} bin/delayed_job stop]
end

# Start delayed job
task :start_delayed_job do
  queue! %[echo "-----> Start delayed job"]
  queue! %[cd #{deploy_to}/#{current_path} ; mkdir -p tmp/pids ; RAILS_ENV=#{rails_env} bin/delayed_job start]
end

# Restart delayed job
task :restart_delayed_job do
  queue! %[echo "-----> Restart delayed job"]
  queue! %[cd #{deploy_to}/#{current_path} ; RAILS_ENV=#{rails_env} bin/delayed_job restart]
end

# Sync database
RYAML = <<-BASH
  function ryaml {
    ruby -ryaml -e 'puts ARGV[1..-1].inject(YAML.load(File.read(ARGV[0]))) {|acc, key| acc[key] }' "$@"
  };
BASH

namespace :data do
  task :pull => :stages do
    isolate do
      queue RYAML
      queue "HOST=$(ryaml #{deploy_to}/#{current_path}/config/database.yml #{rails_env} host)"
      queue "DATABASE=$(ryaml #{deploy_to}/#{current_path}/config/database.yml #{rails_env} database)"
      queue "USERNAME=$(ryaml #{deploy_to}/#{current_path}/config/database.yml #{rails_env} username)"
      queue "PASSWORD=$(ryaml #{deploy_to}/#{current_path}/config/database.yml #{rails_env} password)"
      queue "mysqldump $DATABASE --host=$HOST --user=$USERNAME --password=$PASSWORD > #{deploy_to}/dump.sql"
      queue "gzip -f #{deploy_to}/dump.sql"

      mina_cleanup!
    end

    %x[scp #{user}@#{domain}:#{deploy_to}/dump.sql.gz .]
    %x[gunzip -f dump.sql.gz]
    %x[#{RYAML} mysql --verbose --user=$(ryaml config/database.yml development username) --password=$(ryaml config/database.yml development password) $(ryaml config/database.yml development database) < dump.sql]
    %x[rm dump.sql]
  end
end
