class Server
  def self.call(env)
    if ENV['FAILURE'] == 'request'
      [500, {}, ["A 500 error..."]]
    else
      [200, {}, ["Hello world! This is the test app."]]
    end
  end
end

if ENV['FAILURE'] =~ /\Adie-after-(\d+)\z/
  secs = $1.to_i 
  Thread.new do 
    sleep secs
    Process.exit 1
  end
end

if ENV['FAILURE'] == 'constant-log'
  require 'lorem_ipsum_amet'
  Thread.new do
    loop do
      sleep rand(10) + 3
      puts "[#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}] " + LoremIpsum.random[0,rand(200)]
    end
  end
end

if ENV['FAILURE'] == "slow-start"
  puts "Loading web server... this will take 15 seconds..."
  sleep 15
end

if ENV['FAILURE'] == 'run'
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

