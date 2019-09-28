import React, { useState } from 'react';
import { Flex, Button } from '@chakra-ui/core';
import { useQuery } from '@apollo/react-hooks';
import gql from 'graphql-tag';
import GoogleMapReact from 'google-map-react';

import ListingCard from './ListingCard';

const LOCATION_QUERY = gql`
  query LOCATION_QUERY {
    locations {
      id
      name
      description
      latitude
      longitude
    }
  }
`;

const MapContainer = () => {
  // const []
  const { data, loading } = useQuery(LOCATION_QUERY);
  const [activeLocation, setActiveLocation] = useState(null);

  if (loading) {
    return 'Loading...';
  }

  return (
    <Flex height="100vh">
      <Flex
        width="50%"
        direction="row"
        justifyContent="space-around"
        overflow="auto"
        flexWrap="wrap"
        padding="8px"
      >
        {data.locations.map(location => (
          <ListingCard
            key={location.id}
            setActiveLocation={setActiveLocation}
            location={location}
          />
        ))}
      </Flex>
      <div style={{ height: '100%', width: '50%' }}>
        <GoogleMapReact
          bootstrapURLKeys={{
            key: 'AIzaSyAXHEOXbtuFF8gtR10UZfcyiUVF2j2UK6k',
          }}
          defaultCenter={{
            lat: 37.0902,
            lng: -95.7129,
          }}
          defaultZoom={7}
        >
          {data.locations.map(location => (
            // <AnyReactComponent
            //   lat={location.latitude}
            //   lng={location.longitude}
            //   text={location.name}
            // />
            <Button
              key={location.id}
              // variantColor={location.id === activeLocation ? 'green' : 'orange'}
              variantColor={location.id === activeLocation ? 'teal' : 'gray'}
              lat={location.latitude}
              lng={location.longitude}
            >
              {location.id}
            </Button>
          ))}
        </GoogleMapReact>
      </div>
    </Flex>
  );
};

export default MapContainer;
