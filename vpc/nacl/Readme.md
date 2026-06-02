## Create NACL

````sh
aws ec2 create-network-acl --vpc-id vpc-045508a3749267fd8
````

##Add entry

```sh
aws ec2 create-network-acl-entry \
--network-acl-id acl-0643f467ad3460b1a \
--ingress \
--rule-number 90 \
--protocol -1 \
--port-range From=0,To=65535 \
--cidr-block 76.187.215.12/32 \
--rule-action deny
```


## Get AMI for Amazon Linux 2

Grab the latest AML2 AMI
'''sh
aws ec2 describe-images \
  --owners amazon \
  --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
  --query "Images[?starts_with(Name, 'amzn2')]|sort_by(@, &CreationDate)[-1].ImageId" \
  --region us-east-1 \
  --output text
```

76.187.215.12