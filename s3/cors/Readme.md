## Create website 1

## Create a bucket

```sh 
aws s3 mb s3://cors-fun-mko-2018
```

## Change block publi access

```sh
aws s3api put-public-access-block \
    --bucket cors-fun-mko-2018 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket cors-fun-mko-2018 --policy file://bucket-policy.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-fun-mko-2018 --website-configuration file://website.json
```

## Upload our index.html file & include a resource that would be cros-origin

```sh
aws s3 cp index.html s3://cors-fun-mko-2018
```

## View the website an dsee if index.html is there
```sh
http://cors-fun-mko-2018.s3-website-us-east-1.amazonaws.com
```




# Create website 2

```sh
aws s3 mb s3://cors-fun2-mko-2018
```

## Change block publi access

```sh
aws s3api put-public-access-block \
    --bucket cors-fun2-mko-2018 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket cors-fun2-mko-2018 --policy file://bucket-policy2.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-fun2-mko-2018 --website-configuration file://website.json
```

## Upload our javascript file 

```sh
aws s3 cp hello.js s3://cors-fun2-mko-2018
```

## Create API Gateway with mock response and then text the endpoint
curl -X POST -H "Content-Type: application/json" https://vubf20x0nh.execute-api.us-east-1.amazonaws.com/prod/hello


## Set CORS on our bucket

aws s3api put-bucket-cors --bucket cors-fun-mko-2018 --cors-configuration file://cors.json
