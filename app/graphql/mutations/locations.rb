# frozen_string_literal: true

module Mutations
  Locations = GraphQL::ObjectType.define do
      field :create_location, Types::LocationType do
        argument :name, !types.String
        argument :description, types.String
        argument :latitude, types.Float
        argument :longitude, types.Float
        argument :image, Types::FileType

        resolve ->(_obj, args, _ctx) do
          Location.create(args.to_h)
        end
      end

      field :update_location, Types::LocationType do
        argument :name, !types.String
        argument :description, types.String
        argument :latitude, types.Float
        argument :longitude, types.Float
        argument :image, Types::FileType

        resolve ->(_obj, args, _ctx) do
          location = Location.find_by(id: args[:id])
          location.update(
            args.to_h
          )
          location
        end
      end

      field :destroy_location, Types::LocationType do
        argument :id, !types.ID

        resolve ->(_obj, args, _ctx) do
          locations = Location.find_by(id: args[:id])
          return unless location

          location.destroy
        end
      end
  end
end
