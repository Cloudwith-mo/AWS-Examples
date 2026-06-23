# Create a bucket for cloudtrail logs

aws s3 mb s3://my-cloudtrail-mko-2018

# Create bucket policy to allow cloudtrail to put bucket.

aws s3api put-bucket-policy --bucket my-cloudtrail-mko-2018 --policy file://bucket-policy.json

# Create Trail
aws cloudtrail create-trail \
--name MyTrail \
--s3-bucket-name my-cloudtrail-mko-2018 \
--region us-east-1

# Start Logging

aws cloudtrail start-logging --name MyTrail


