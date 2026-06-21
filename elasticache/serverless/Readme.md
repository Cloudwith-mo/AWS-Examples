# Create Serverless Cache

```sh
aws elasticache create-serverless-cache \
  --serverless-cache-name my-cache-mko-2018 \
  --engine redis \
  --major-engine-version 7
```
# Install Rdis
sudo apt-get install redis -y

# Connect to instance
redis-cli -h my-cache-mko-2018-3iymyk.serverless.use1.cache.amazonaws.com