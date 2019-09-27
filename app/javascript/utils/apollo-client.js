import ApolloClient from 'apollo-boost';

const tokenElement = document.querySelector('[name=csrf-token]');

export const client = new ApolloClient({
  uri: '/graphql',
  headers: {
    'X-CSRF-Token': tokenElement ? tokenElement.content : '',
  },
  // cacheRedirects: {
  //   Properties: {
  //     property: (_, args, { getCacheKey }) => {
  //       return getCacheKey({ __typename: 'Property', id: args.id });
  //     },
  //   },
  // },
});
