# frozen_string_literal: true

module Util
  class FieldCombiner
    # Combines mutations and queries
    def self.combine(query_types)
      Array(query_types).inject({}) do |acc, query_type|
        acc.merge!(query_type.fields)
      end
    end
  end
end
