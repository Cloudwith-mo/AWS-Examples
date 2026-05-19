## Create a Bucket

aws s3 mb s3://encrypt-client-fun-mko-2018


## Run our SDK ruby script

bundle exec ruby encrypt.rb


# Cleanup
aws s3 rm s3://encrypt-client-fun-mko-2018/hello.txt
aws s3 rb s3://encrypt-client-fun-mko-2018

