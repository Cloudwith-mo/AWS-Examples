## Convert to json 

```sh
yq -o json policy.yaml > policy.json
```

The bash script

```sh
./convert
```


# Create IAM policy

```sh
aws iam create-policy \
--policy-name my-fun-policy \
--policy-document file://policy.json
```

## Attach Policy to user

```sh
aws iam attach-user-policy \
--policy-arn arn:aws:iam::114743615542:policy/my-fun-policy \
--user-name mko-example
```