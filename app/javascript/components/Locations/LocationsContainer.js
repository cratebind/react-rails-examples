import React from 'react';
import Location from './Location';

const LocationsContainer = ({ locations }) => {
  return (
    <div className="locations-container">
      <h1>Locations</h1>
      <div className="cards-container">
        {locations.map(location => (
          <Location key={location.id} location={location} />
        ))}
      </div>
    </div>
  );
};

export default LocationsContainer;
