require 'opensearch-aws-sigv4'
require 'aws-sigv4'
require 'pry'

signer = Aws::Sigv4::Signer.new(
service: 'es',
region: 'us-east-1',
access_key_id: ENV['AWS_ACCESS_KEY_ID'],
secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
)
client = OpenSearch::Aws::Sigv4Client.new({
    host: 'https://search-mydomain-4hntmlchzpm3mjsu2l3j4mqsua.us-east-1.es.amazonaws.com',
    log: true
  }, signer)

# Create an index and document
index = 'prime'
results = client.indices.create(index: index)
binding.pry


# Create docs in index
results = client.index(
  index: index,
  id: '1', body: {
    name: 'Amazon Echo',
    msrp: '5999',
    year: 2011
  }
)
binding.pry

# Search for the document
results = client.search(body: {query: {match: {name: 'Echo'}}})
binding.pry

# Delete the document
results = client.delete(index: index, id: '1')
binding.pry

# Delete the index
results = client.indices.delete(index: index)
binding.pry
