require 'aws-sdk-sqs'
require 'pry'

client = Aws::SQS::Client.new

queue_url = "https://sqs.us-east-1.amazonaws.com/114743615542/sqs-standard-MyQueue-813w5Up5AonT"
resp = client.receive_message({
  queue_url: queue_url,
  attribute_names: ['All'],
  message_attribute_names: ['All'],
  max_number_of_messages: 1,
  visibility_timeout: 1,
  wait_time_seconds: 1
})

resp.messages.each do |message|
  puts message.body
  puts message.attributes.inspect
  handle = message.receipt_handle
  resp = client.delete_message({
    queue_url: queue_url,
    receipt_handle: handle
  })
end
