# Create Buckets
```sh
aws s3 mb s3://source-datasync-mko-2018
aws s3 mb s3://dest-datasync-mko-2018
```

# Upload file
```sh
touch hello.txt
aws s3 cp hello.txt s3://source-datasync-mko-2018/data/hello.txt
```

