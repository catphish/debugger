task :build do
  puts "\e[33mWelcome to vdt-debugger...\e[34m it's magical!\e[0m"
  puts "Starting with: #{ENV['MODE'] || 'No mode'}"

  if ENV['MODE'] == 'fail-on-build'
    puts "\e[31mBuild did not complete successfully.\e[0m"
    Process.exit 1
  else
    puts "\e[32mFaux build completed successfully.\e[0m"
  end
end
