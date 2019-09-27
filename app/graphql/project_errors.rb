# frozen_string_literal: true

GraphQL::Errors.configure(ProjectSchema) do
  rescue_from ActiveRecord::RecordNotFound do |_exception|
    nil
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    GraphQL::ExecutionError.new(exception.record.errors.full_messages.join("\n"))
  end

  # rescue_from StandardError do |_exception|
  #   GraphQL::ExecutionError.new('Please try to execute the query for this field later')
  # end
end
