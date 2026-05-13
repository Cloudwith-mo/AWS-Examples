## Create a new bucket

```md
aws s3 mb s3://checksums-examples-mko-8921
```

## Create a file that we will do a checksumon

```md
echo "Helloe Jupiter!!!" > myfile.txt
```

## Get a checksum of a file for md5

```md
md5sum myfile.txt
```
# b96ad18beb0af90e9bc3118aa0036974  myfile.txt

## Upload our file to s3
```
aws s3 cp myfile.txt s3://checksums-examples-mko-8921
aws s3api head-object --bucket checksums-examples-mko-8921 --key myfile.txt
```


## Lets upload a file with a different kind of checksums

```
bundle exec ruby crc.rb
```

```sh
aws s3 put-object \
--bucket="checksums-examples-mko-8921" \
--key="myfilesha1.txt" \
--body="myfile.txt" \
--checksum-algorithm="SHA1" \
--checksum-sha1="5a9c80f99c01050cc55a6b0037f787467be6acb1"
```