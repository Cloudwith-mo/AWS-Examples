## Create a bucket 

```sh
aws s3api create-bucket --bucket acl-example-mko-2018 --region us-east-1
```

## Turn off block public access for ACLsaws s3api 

```sh
aws s3api put-public-access-block \
    --bucket acl-example-mko-2018 \
    --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true
```

```sh
aws s3api get-public-access-block \
    --bucket acl-example-mko-2018 \
```

## Change bucket Ownership

```sh
aws s3api put-bucket-ownership-controls \
    --bucket acl-example-mko-2018 \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change ACLs to allow for a user in another AWS Account

```sh
aws s3api put-bucket-acl \
    --bucket acl-example-mko-2018 \
    --access-control-policy="file:///home/mko/projects/AWS-Examples/s3/acls/policy.json"
```

## Access bucket from other account

```sh
touche bootcamp.txt
aws s3 cp bootcamp.txt s3://acl-example-mko-2018
aws s3 ls s3://acl-example-mko-2018
```

## Clean up

```sh
aws s3 rm s3://acl-example-mko-2018/bootcamp.txt
aws s3 rb s3://acl-example-mko-2018
```