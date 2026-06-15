require 'mqtt'

host = "mqtts://admin:Testing123456!@b-4b1abfb0-93a2-4fab-88a2-848245f7d995-1.mq.us-east-1.amazonaws.com:8883"
topic = 'test/topic'
message = "Hello World! MQTT"

begin
  MQTT::Client.connect(host) do |client|
    client.publish(topic, message)
  end
rescue => e
  puts e.inspect
end