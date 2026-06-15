require 'bunny'

connection_string = "amqps://admin:Testing123456!@b-a5c15e86-2a52-42ac-9556-4780f0248846.mq.us-east-1.on.aws:5671"
connection = Bunny.new(connection_string)
connection.start

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