# frozen_string_literal: true

module Queries
  Locations = GraphQL::ObjectType.define do
    name 'Locations'
    description 'Location CRUD'

    field :locations, types[Types::LocationType], 'Returns all locations' do
      resolve ->(_obj, _args, _ctx) do
        Location.all
      end
    end

    field :location, Types::LocationType, 'Returns a single location' do
      argument :id, !types.ID
      resolve ->(_obj, args, _ctx) do
        Location.find_by(id: args[:id])
      end
    end
  end
end
