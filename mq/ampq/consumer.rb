require 'bunny'

connection = Bunny.new
channel = connection.create_channel
queue = channel.queue('hello')

begin
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts body
  end
rescue => e
  puts e.inspect
  channel.close
  connection.close
  exit(0)
end
