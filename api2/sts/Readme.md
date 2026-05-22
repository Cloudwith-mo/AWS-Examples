 ## Create a user with no permissions

 We need to create a new user with no permissions & generate out access keys

```sh
aws iam create-user --user-name sts-mko-user
aws iam create-access-key --user-name sts-mko-user --output table
```

Copy the access key & secret here
```sh
aws configure
```

Then edit credentials file to change away from default profile

```sh
open ~/.aws/credentials
```

Test who you are:

```sh
aws sts get-caller-identity
aws sts get-caller-identity --profile sts
```

Make sure you don't have access to s3

```sh
aws s3 ls --profile sts
```
An error occurred (AccessDenied) when calling the ListBuckets operation: User: arn:aws:iam::114743615542:user/sts-mko-user is not authorized to perform: s3:ListAllMyBuckets because no identity-based policy allows the s3:ListAllMyBuckets action

 ## Create a Role

We need to create a role that will access a new resource

```sh
chmod u+x bin/deploy
./bin/deploy
```

 ## Use a new user credentials and assume role

```sh
aws iam put-user-policy \
--user-name sts-mko-user \
--policy-name StsAssumePolicy \
--policy-document file://policy.json
```

```sh
aws sts assume-role \
--role-arn arn:aws:iam::114743615542:role/sts-fun-mko-2018-StsRole-NcnVeqLGME6O \
--role-session-name s3-sts-fun-mko \
--profile sts
```

```sh
aws sts get-caller-identity --profile assumed
```

```sh
aws s3 ls --profile assumed
```

## Cleanup

Tear down your cloudformation stack via AWS management console

```sh
aws iam delete-user-policy --user-name sts-machine-user --policy-name StsAssumePolicy
aws iam delete-access-key --access-key-id AKIARVN2AUA3O2HCNPXD --user-name sts-mko-user
aws iam delete-user --user-name sts-mko-user
```
   