# Amazon DocumentDB Elastic Cluster - CloudShell Lab

## Goal

Connect to Amazon DocumentDB Elastic Cluster using AWS CloudShell VPC environment and test basic CRUD commands with `mongosh`.

---

## Endpoint

```bash
ENDPOINT="mydocumentdb-114743615542.us-east-1.docdb-elastic.amazonaws.com"
```

Default port:

```bash
27017
```

---

## 1. Use CloudShell VPC Environment

Use CloudShell inside the same VPC as DocumentDB.

Steps:

```text
AWS CloudShell
→ Actions
→ Create VPC environment
→ Select same VPC as DocumentDB
→ Select subnet
→ Select security group
→ Launch
```

---

## 2. Security Group Rule

DocumentDB security group needs inbound access:

```text
Type: Custom TCP
Port: 27017
Source: CloudShell VPC security group
```

For quick lab testing only:

```text
Source: 0.0.0.0/0
```

Remove broad access after testing.

---

## 3. Test Network Access

```bash
sudo dnf install -y nmap-ncat
nc -vz $ENDPOINT 27017
```

Successful output:

```text
Ncat: Connected to 172.31.x.x:27017.
```

---

## 4. Check mongosh

```bash
mongosh --version
```

---

## 5. Connect to DocumentDB

```bash
mongosh "mongodb://$ENDPOINT:27017/admin?tls=true&retryWrites=false" \
  --username docadmin \
  --password \
  --tlsAllowInvalidCertificates
```

Enter the DocumentDB admin password when prompted.

Successful prompt:

```text
[direct: mongos] admin>
```

Note: `--tlsAllowInvalidCertificates` was used for this lab because CloudShell VPC environment could not download the AWS cert bundle. For production, use the proper AWS CA bundle.

---

## 6. Test Commands Inside mongosh

Switch to test DB:

```javascript
use test
```

Insert one document:

```javascript
db.people.insertOne({
  name: "Steve",
  hobbies: ["hiking", "tennis", "fly fishing"],
  siblings: {
    brothers: 0,
    sisters: 1
  }
})
```

Insert many documents:

```javascript
db.people.insertMany([
  {
    _id: 1,
    name: "Steve",
    hobbies: ["hiking", "tennis", "fly fishing"],
    siblings: { brothers: 0, sisters: 1 }
  },
  {
    _id: 2,
    name: "Sally",
    hobbies: ["skiing", "stamp collecting"],
    siblings: { brothers: 1, sisters: 0 }
  }
])
```

View documents:

```javascript
db.people.find().pretty()
```

Count documents:

```javascript
db.people.countDocuments()
```

Find one document:

```javascript
db.people.findOne({ name: "Sally" })
```

Update one document:

```javascript
db.people.updateOne(
  { name: "Sally" },
  { $set: { status: "active" } }
)
```

Delete one document:

```javascript
db.people.deleteOne({ name: "Steve" })
```

Exit:

```javascript
exit
```

---

## Quick Reference

```bash
ENDPOINT="mydocumentdb-114743615542.us-east-1.docdb-elastic.amazonaws.com"

nc -vz $ENDPOINT 27017

mongosh "mongodb://$ENDPOINT:27017/admin?tls=true&retryWrites=false" \
  --username docadmin \
  --password \
  --tlsAllowInvalidCertificates
```

---

## Cleanup

After the lab:

```text
- Remove 0.0.0.0/0 inbound access on port 27017
- Lock access to CloudShell or EC2 security group
- Delete test data if needed
- Delete unused DocumentDB resources to avoid charges
```
