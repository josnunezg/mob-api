module Resolvers
  class Base < GraphQL::Schema::Resolver
    include ::HandlerServiceResult
  end
end
