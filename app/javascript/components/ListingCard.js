import React from 'react';
import { Box, Image, Link } from '@chakra-ui/core';

const ListingCard = ({ location, setActiveLocation }) => {
  const property = {
    imageUrl: 'https://bit.ly/2Z4KKcF',
    imageAlt: 'Rear view of modern home with pool',
  };

  return (
    <Link
      maxW="xs"
      borderWidth="1px"
      rounded="lg"
      // overflow="hidden"
      marginBottom={5}
      onHover={() => setActiveLocation(location.id)}
    >
      <Image src={property.imageUrl} alt={property.imageAlt} />
      <Box p="6">
        {/* <Box d="flex" alignItems="baseline">
          <Badge rounded="full" px="2" variantColor="teal">
            {location.id}
          </Badge>
          <Box
            color="gray.500"
            fontWeight="semibold"
            letterSpacing="wide"
            fontSize="xs"
            textTransform="uppercase"
            ml="2"
          >
            {property.beds} beds &bull; {property.baths} baths
          </Box>
        </Box> */}

        <Box
          mt="1"
          fontWeight="semibold"
          as="h4"
          lineHeight="tight"
          isTruncated
        >
          {location.name}
        </Box>

        <Box>
          <Box as="span" color="gray.600" fontSize="sm">
            {location.description}
          </Box>
        </Box>

        {/* <Box d="flex" mt="2" alignItems="center">
          <Box as="span" ml="2" color="gray.600" fontSize="sm">
            {property.reviewCount} reviews
          </Box>
        </Box> */}
      </Box>
    </Link>
  );
};

export default ListingCard;
