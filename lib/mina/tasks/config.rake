namespace :mina_data_sync do
  task config: :environment do
    dc = ActiveRecord::Base.configurations[Rails.env].to_yaml
    adapter = dc['adapter']
    database = dc['database']
    host = dc['host']
    username = dc['username']
    password = dc['password']
    port = dc['port']
    arguments = ''
    case adapter.to_s
    when 'postgresql'
      arguments += ' -d ' + database if database
      arguments += ' -h ' + host if host
      arguments += ' -U ' + username if username
      arguments += ' -p ' + port.to_s if port
    when 'mysql2'
      arguments += ' ' + database if database
      arguments += ' -h ' + host if host
      arguments += ' -u ' + username if username
      arguments += ' --password=' + password if password
      arguments += ' -P ' + port.to_s if port
    end
    puts arguments
  end
end
