# frozen_string_literal: true

class ProjectSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
