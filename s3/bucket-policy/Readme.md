## Create a bucket

aws s3 mb s3://bucket-policy-example-mko-2018

## Create Bucket policy

aws s3api put-bucket-policy --bucket bucket-policy-example-mko-2018 --policy file://policy.json

## In the other acct, access the bucket

touch bootcamp.txt
aws s3 cp bootcamp.txt s3://bucket-policy-example-mko-2018
aws s3 ls s3://bucket-policy-example-mko-2018


## Cleanup
aws s3 rm s3://bucket-policy-example-mko-2018/bootcamp.txt
aws s3 rb s3://bucket-policy-example-mko-2018

