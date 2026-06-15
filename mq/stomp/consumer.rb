require 'stomp'

login = 'admin'
passcode = 'Testing123456!'
host = 'b-4b1abfb0-93a2-4fab-88a2-848245f7d995-1.mq.us-east-1.amazonaws.com'
port = 61614

config = {
  hosts: [
    {
      login: login,
      passcode: passcode,
      host: host,
      port: port,
      ssl: true
    }
  ]
}


client = Stomp::Client.new(config)
dest = '/queue/test'
client.subscribe(dest) do |message|
  puts 'subbed'
  puts message
  client.acknowledge(message)
end
client.join

