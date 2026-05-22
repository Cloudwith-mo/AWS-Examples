## Create a user with no permissions

We need to create a new user with no permission and generate out access keys.

```sh
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table
```

Copy the access key & secret here
```sh
aws configure
```

Then edit credential file to change away from default profile

```sh
open ~/.aws/credentials
```

Test who you are

```sh
aws sts get-caller-identity
aws sts get-caller-identity --profile sts
```

Make sure you don't have access to s3

```sh
aws s3 ls --profile sts
```
## Create a Role

We need to create a role that will access a new resource

## Use new user credentials and assume role