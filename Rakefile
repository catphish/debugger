task :build do
  puts "\e[33mWelcome to failer...\e[34m it's magical!\e[0m"
  puts "Starting with: #{ENV['FAILURE'] || 'No failure'}"
  
  if ENV['FAILURE'] == 'build'
    puts "Build did not complete successfully."
    Process.exit 1
  else
    puts "Faux build completed successfully."
  end
end