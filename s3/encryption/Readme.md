## Create a new bucket
```sh
aws s3 mb s3://encryption-fun-mko-2018
```
## Create a file & Put Object with Encryption SSE-S3
```sh 
echo "Hello, world! Mo, is a Cloud-Savant & Terminal Wizard!" > hello.txt
aws s3 cp hello.txt s3://encryption-fun-mko-2018
```
## Put Object with Encryption of SSE-KMS

aws s3api put-object \
    --bucket encryption-fun-mko-2018 \
    --key hello.txt \
    --body hello.txt \
    --server-side-encryption "aws:kms" \
    --ssekms-key-id "f199213a-eb7f-4eb0-a058-0043b193e54d"

## Put Object with SSE-C

export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
echo $BASE64_ENCODED_KEY

export MD5_VALUE=$(echo $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64 -w0)
echo $MD5_VALUE

aws s3api put-object \
    --bucket encryption-fun-mko-2018 \
    --key hello.txt \
    --body hello.txt \
    --sse-customer-algorithm AES256 \
    --sse-customer-key $BASE64_ENCODED_KEY \
    --sse-customer-key- md5 $MD5_VALUE

An error occured (InvalidArguement) when calling the PutObject operation: The calculated MD5 hash of the key did not match the hash that was provided. 

## Put Object with SSE-C via aws s3

https://calatog....

openssl rand -out ssec.key 32

aws s3 cp hello.txt s3://encryption-fun-mko-2018/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key

aws s3 cp hello.txt s3://encryption-fun-mko-2018/hello.txt --sse-c AES256 --sse-c-key fileb://ssec.key