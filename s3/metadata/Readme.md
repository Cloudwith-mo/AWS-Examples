## Create a Bucket

aws s3 mb s3://metadata-fun-mko-2018

## Create a new file

echo "Hello Saturn!!!" > hello.txt

## Upload file with metadata

aws s3api put-object --bucket metadata-fun-mko-2018 --key hello.txt --body hello.txt --metadata Planet=Saturn

## Get metadata through head object

aws s3api head-object --bucket metadata-fun-mko-2018 --key hello.txt

## Cleanup

aws s3 rm s3://metadata-fun-mko-2018/hello.txt
aws s3 rb s3://metadata-fun-mko-2018