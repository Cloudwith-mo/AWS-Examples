# Create Secret via Secrets Manager 

```sh
aws secretsmanager create-secret \
--name MyRdsPassword \
--description "My rds password" \
--secret-string "{\"password\":\"mypassword\"}"
```

# Install Postgres Client on EC2 Instance AML2023 X86

sudo dnf install postgresql18.x86_64 postgresql18-server -y

# Connection String URL

postgresql://[user[:password]@][netloc][:port][/dbname][?param1=value1&...]

postgresql://muhammadadeyemi:mypassword@rds-basic-rdsinstance-qqp2hztqtmxm.ccpweygw8wnc.us-east-1.rds.amazonaws.com:5432/mydatabase

# Create a table

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date DATE,
    status VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);