module HandlerServiceResult
  extend ActiveSupport::Concern

  def handle_service(service)
    return service.result if service.success?

    error = service.error

    context[:logger].error(error.as_json)

    raise GraphQL::ExecutionError.new(error.message, extensions: error.as_json)
  end
end
