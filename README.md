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

You can use the only parts of the sync:

``` ruby
mina data_sync:dump_remote
mina data_sync:dump_local
mina data_sync:copy_local_to_remote
mina data_sync:copy_remote_to_local
mina data_sync:restore_remote
mina data_sync:restore_local
```

## Configruation

configurable variables with defaults
```ruby
set :database_path, "config/database.yml"
set :remote_backup_path, 'tmp'
set :local_backup_path, -> { ENV['DATA_SYNC_BACKUP_PATH'] || 'tmp' }
set :backup_file, -> { %{#{fetch(:repository).split('/').last.split('.').first}-#{fetch(:rails_env)}-#{Date.today}.sql} }
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mina-data_sync/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
