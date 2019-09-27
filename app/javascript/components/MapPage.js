import React from 'react';
import { ThemeProvider, CSSReset } from '@chakra-ui/core';
import { ApolloProvider } from '@apollo/react-hooks';
import { client } from '../utils/apollo-client';
// import MapContainer from './MapContainer';

const MapPage = () => {
  return (
    <ApolloProvider client={client}>
      <ThemeProvider>
        <CSSReset />
        test
      </ThemeProvider>
    </ApolloProvider>
  );
};

export default MapPage;
