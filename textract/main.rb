require 'aws-sdk-textract'
require 'pry'
client = Aws::Textract::Client.new region: 'us-east-1'
bucket = 'textract-example-2018'
name = 'tax-doc.png'
resp = client.analyze_document({
  document: { # required
    s3_object: {
      bucket: bucket,
      name: name,
      #version: "S3ObjectVersion",
    },
  },
  
  feature_types: ["TABLES"] # required, accepts TABLES, FORMS, QUERIES, SIGNATURES, LAYOUT
})
binding.pry