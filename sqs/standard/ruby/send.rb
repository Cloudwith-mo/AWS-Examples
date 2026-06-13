require 'aws-sdk-sqs'

client = Aws::SQS::Client.new

queue_url = "https://sqs.us-east-1.amazonaws.com/114743615542/sqs-standard-MyQueue-813w5Up5AonT"
resp = client.send_message({
  queue_url: queue_url,
  message_body: "Hello Ruby!", # required
  delay_seconds: 1,
  message_attributes: {
    "Fruit" => {
      string_value: "Apple",
      data_type: "String"
    },
  }
})