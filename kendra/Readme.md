# Create Bucket
```sh
aws s3 mb s3://kendra-exp-2018 --region us-east-
cd split
aws s3 sync . s3://kendra-exp-2018 --region us-east-1
```

# Creating Our Index
```sh
aws kendra create-index \
--edition DEVELOPER_EDITION \
--name my-index2 \
--description "My Index2" \
--region us-east-1 \
--role-arn arn:aws:iam::114743615542:role/KendraIndexRole
```

# Creating our Data Source
```sh
aws kendra create-data-source \
--index-id 3c33c6fd-6313-4b3a-a797-6219ffa3adbf \
--name my-data-source \
--role-arn arn:aws:iam::114743615542:role/KendraDataSourceRole \
--type S3 \
--configuration '{"S3Configuration":{"BucketName": "kendra-exp-2018"}}' \
--region us-east-1
```
# Sync
```sh
aws kendra start-data-source-sync-job \
--id 6958085e-0f16-4621-9d00-d3b4e5312088 \
--index-id 3c33c6fd-6313-4b3a-a797-6219ffa3adbf
```

# Query
```sh
aws kendra query \
--index-id 3c33c6fd-6313-4b3a-a797-6219ffa3adbf \
--query-text "You can talk as you eat, can't you?"
--region us-east-1
```

aws kendra query \
  --index-id 3c33c6fd-6313-4b3a-a797-6219ffa3adbf \
  --query-text "You can talk as you eat, can't you?" \
  --region us-east-1 \
  --query 'ResultItems[*].{
    Type: Type,
    Confidence: ScoreAttributes.ScoreConfidence,
    Title: DocumentTitle.Text,
    Excerpt: DocumentExcerpt.Text,
    URI: DocumentURI
  }'

  aws kendra query \
  --index-id 3c33c6fd-6313-4b3a-a797-6219ffa3adbf \
  --query-text "You can talk as you eat, can't you?" \
  --region us-east-1 \
  --query 'ResultItems[*].{
    Type: Type,
    Confidence: ScoreAttributes.ScoreConfidence,
    Title: DocumentTitle.Text,
    Excerpt: DocumentExcerpt.Text
  }' \
  --output table