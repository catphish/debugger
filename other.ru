class Server
  def self.call(env)
    [200, {'Content-Type' => 'text/html'}, ["<b style='color:#33dac2'>Hello from the other web server! My path is: #{env['PATH_INFO']}</b>"]]
  end
end

run Server
