import { Amplify } from 'aws-amplify';
import config from './aws-exports.js';
import { generateClient } from 'aws-amplify/api';

Amplify.configure(config);

const client = generateClient();

const listMyAppsyncs = /* GraphQL */ `
  query ListMyAppsyncs {
    listMyAppsyncs {
      items {
        pk
        Fruit
        Level
      }
      nextToken
    }
  }
`;

async function fetchData() {
  try {
    const data = await client.graphql({ query: listMyAppsyncs });
    console.log('Data:', JSON.stringify(data, null, 2));
  } catch (error) {
    console.error('Error fetching data:', error);
  }
}

fetchData();