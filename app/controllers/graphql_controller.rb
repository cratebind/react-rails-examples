# frozen_string_literal: true

class GraphqlController < ApplicationController
  skip_before_action :verify_authenticity_token

  # Executes GraphQL request
  def execute
    context = {}

    result = if params[:_json]
               queries = params[:_json].map do |param|
                 {
                   query: params[:query],
                   operation_name: param[:operationName],
                   variables: ensure_hash(param[:variables]),
                   context: context
                 }
               end
               ProjectSchema.multiplex(queries)
             else
               ProjectSchema.execute(
                 params[:query],
                 operation_name: params[:operationName],
                 variables: ensure_hash(params[:variables]),
                 context: context
               )
             end

    render json: result
  rescue StandardError => e
    # rubocop:disable Rails/UnknownEnv
    raise e unless Rails.env.development? || Rails.env.daily?
    handle_error_in_development e
    # rubocop:enable Rails/UnknownEnv
  end

  private

  # Checks the headers to authenticate any GraphQL request
  def authenticate!
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  # Handles error in development
  def handle_error_in_development(err)
    logger.error err.message
    logger.error err.backtrace.join("\n")

    render json: { error: { message: err.message, backtrace: err.backtrace }, data: {} },
           status: :internal_server_error
  end
end
