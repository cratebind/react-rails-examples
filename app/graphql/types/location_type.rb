# frozen_string_literal: true

module Types
  class LocationType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :latitude, Float, null: true
    field :longitude, Float, null: true

    # Fetches the url of a stored image
    def image_url
      return object.image.service_url if object.image.attached?
      nil
    end
  end
end