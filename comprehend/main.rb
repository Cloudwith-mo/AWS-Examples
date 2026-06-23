require 'aws-sdk-comprehend'
require 'pry'

client =Aws::Comprehend::Client.new
text = "hello world! This is MKO the goat, doing an awful test with Comprehend. I  hate this service."

resp = client.detect_sentiment({
    text: text,
    language_code: 'en'
})
#binding.pry
puts resp.sentiment