# Mina::DataSync

You can sync your production and local database

## Requirements

* `rsync`
* `mina` (Duh)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina', require: false
gem 'mina-data_sync', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-data_sync
    
Require it in your deploy script:

```ruby
# config/deploy.rb
require 'mina/data_sync'
```

## Usage

```ruby
mina data_sync:pull # pulls remote to local
mina data_sync:push # pushes local to remote
```

## Configruation

configurable variables with defaults
```ruby
set :database_path, "config/database.yml"
set :remote_backup_path, 'tmp'
set :local_backup_path, -> { ENV['DATA_SYNC_BACKUP_PATH'] || 'tmp' }
# if false will only make a dump and copy it without doing restore
set :restore_data, -> { ENV['restore'] || 'true' }
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mina-data_sync/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
