# Create Subnet Group

aws memorydb create-subnet-group \
    --subnet-group-name mysubnetgroup \
    --description "my subnet group" \
    --subnet-ids subnet-0ee86e83bfb829c78 subnet-0591d6e464acc4da8 \
    --query SubnetGroup.ARN \
    --output text

# Create User

aws memorydb create-user \
--user-name mkodagoat \
--access-string "on ~* &* +@all" \
--authentication-mode Passwords="Testing123456789!",Type=password

# Create ACL

aws memorydb create-acl \
    --acl-name "new-acl-1" \
    --user-names "mkodagoat"

# Create Cluster

```sh
aws memorydb create-cluster \
    --cluster-name my-new-cluster \
    --node-type db.t4g.small \
    --acl-name new-acl-1 \
    --subnet-group mysubnetgroup
```