## Create a bucket 

aws s3 mb s3://class-fun-mko-2018

## Create a file 

echo "Hello Pluto!!" > hello.txt

aws s3 cp hello.txt s3://class-fun-mko-2018

aws s3 cp hello.txt s3://class-fun-mko-2018 --storage-class STANDARD_IA

## Clean Up
aws s3 rm s3://class-fun-mko-2018/hello.txt
aws s3 rb s3://class-fun-mko-2018

