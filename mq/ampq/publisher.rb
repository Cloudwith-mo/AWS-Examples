require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel
queue = channel.queue('hello')
exchange = channel.default_exchange


begin
  exchange.publish("Hello World!", routing_key: queue.name)
  channel.close
  connection.close
rescue => e
  puts e.inspect
  channel.close
  connection.close
  exit(0)
end
