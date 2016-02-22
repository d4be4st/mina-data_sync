require 'yaml'
require 'erb'
require 'mina/data_sync/defaults'
require 'mina/data_sync/helpers'
require 'mina/data_sync/version'
require 'mina/data_sync/tasks'

module Mina
  module DataSync
    if defined? Rails::Railtie
      require 'rails'
      class Railtie < Rails::Railtie
        rake_tasks do
          load 'tasks/config.rake'
        end
      end
    end
  end
end
