import React from 'react';
import PropTypes from 'prop-types';

const Location = ({ location }) => {
  return (
    <div className="card">
      <div className="card-title">{location.name}</div>
      <div className="card-actions">
        <a href={`/locations/${location.id}`}>show</a>
        <a href={`/locations/${location.id}/edit`}>edit</a>
        <a
          data-method="delete"
          href={`/locations/${location.id}`}
          rel="nofollow"
        >
          delete
        </a>
      </div>
    </div>
  );
};

Location.propTypes = {
  location: PropTypes.shape({
    created_at: PropTypes.string,
    description: PropTypes.string,
    id: PropTypes.number,
    name: PropTypes.string,
    latitude: PropTypes.number,
    longitude: PropTypes.number,
    updated_at: PropTypes.string,
  }),
};

export default Location;
