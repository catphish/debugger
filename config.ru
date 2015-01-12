puts "\e[33mWelcome to vdt-debugger...\e[34m it's magical!\e[0m"
puts "Starting with: #{ENV['MODE'] || 'No mode'}"

class Streamer
  def each
    5.times do |i|
      yield "Hello #{i}\n"
      sleep 0.5
    end
  end
end

class Server
  def self.call(env)
    if ENV['MODE'] == "fail-on-request"
      [500, {}, ["A 500 error..."]]
    else
      case env['PATH_INFO']
      when /\A\/stream\z/
        [200, {}, Streamer.new]
      when /\A\/request-id\z/
        [200, {}, ["The request ID is: #{env['HTTP_X_REQUEST_ID'] || 'not provided'}"]]
      else
        [200, {}, ["Hello world! This is the test app."]]
      end
    end
  end
end

if ENV['MODE'] =~ /\Adie-after-(\d+)\z/
  secs = $1.to_i
  Thread.new do
    sleep secs
    Process.exit 1
  end
end

#
# Print some stuff in colors when we start
#
puts "\e[1mWelcome to the application (bold)\e[0m"
puts " \e[2mWelcome to the application (faint)\e[0m"
puts "  \e[3mWelcome to the application (italic)\e[0m"
puts "   \e[4mWelcome to the application (underline)\e[0m"
puts "    \e[9mWelcome to the application (crossed)\e[0m"
(1..7).to_a.each do |i|
  puts "   #{' ' * i}\e[3#{i}mWelcome to the application (3#{i})\e[0m"
  puts "    #{' ' * i}\e[4#{i}mWelcome to the application (4#{i})\e[0m"
end

#
# Logging
#
if ENV['MODE'] == 'constant-log' || ENV['MODE'] == 'fast-log' || ENV['MODE'] == 'very-fast-log'
  require 'lorem_ipsum_amet'
  Thread.new do
    loop do
      case ENV['MODE']
      when 'fast-log'
        sleep(rand(2) + 1)
      when 'very-fast-log'
        sleep("0.#{rand(3)+1}".to_f)
      else
        sleep(rand(10) + 3)
      end
      puts "[#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}] " + LoremIpsum.random[0,rand(200)]
    end
  end
end

#
# Slow start
#
if ENV['MODE'] == "slow-start"
  puts "Loading web server... this will take 15 seconds..."
  sleep 15
end

#
# Fail on run
#
if ENV['MODE'] == "fail-on-run"
  puts "Process failed to start, but here's something to make it better:"
  puts
  puts "Humpty Dumpty sat on a wall,"
  puts "Humpty Dumpty had a great fall."
  puts "All the king's horses and all the king's men"
  puts "Couldn't put Humpty together again."
  Process.exit 1
else
  run Server
end

