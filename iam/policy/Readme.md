## Convert to json 

```sh
yq -o json policy.yaml > policy.json
```

The bash script

```sh
./update
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

# Deleting Policies

```sh
aws iam delete-policy-version --policy-arn arn:aws:iam::114743615542:policy/my-fun-policy --version-id v1
aws iam delete-policy-version --policy-arn arn:aws:iam::114743615542:policy/my-fun-policy --version-id v2
aws iam delete-policy-version --policy-arn arn:aws:iam::114743615542:policy/my-fun-policy --version-id v3
aws iam delete-policy-version --policy-arn arn:aws:iam::114743615542:policy/my-fun-policy --version-id v4

```