lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/data_sync'

set :repository, 'git@bitbucket.org:infinum_hr/rails-truck.git'
set :user, 'deploy'
set :domain, 'truck-ec2.infinum.co'
set :deploy_to, '/home/deploy/www/t/truck-staging.infinum.co'
set :rails_env, 'staging'
set :branch, 'master'
set :port, 22

