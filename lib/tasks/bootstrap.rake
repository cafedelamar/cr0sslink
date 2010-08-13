desc 'Load the database and change the secret'
task :bootstrap => :environment do
  puts "Migratin..."
  Rake::Task["db:migrate"].invoke
  
  puts "Changing session secret..."
  new_secret = ActiveSupport::SecureRandom.hex(64)
  config_file_name = Rails.root.join('config', 'initializers', 'session_store.rb')
  config_file_data = File.read(config_file_name)
  File.open(config_file_name, 'w') do |file|
    file.write(config_file_data.sub('35be6b089220806a0c91598601a515ce79a753f3b09414e02fece5a9ef449a8253614b9dea044e27dd4369593c738d6f63067696dda15d639cb5705585aada7c', new_secret))
  end
  
  puts "All done!"
end
