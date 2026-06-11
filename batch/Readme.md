# Build Image
docker build -t app .

# Register Job

aws batch register-job-definition \
  --job-definition-name square-job \
  --type container \
  --container-properties '{
    "image": "114743615542.dkr.ecr.us-east-1.amazonaws.com/app",
    "vcpus": 1,
    "memory":128
    
    }'

# Create Queue

aws batch create-job-queue \
  --job-queue-name my-job-queue \
  --state ENABLED \
  --priority 1 \
  --compute-environment-order '[
    {
      "order": 1,
      "computeEnvironment": "arn:aws:batch:us-east-1:114743615542:compute-environment/ComputeEnvironment"
    }
  ]'

# Submit Job

aws batch submit-job \
  --job-name my-job \
  --job-definition square-job \
  --job-queue my-job-queue