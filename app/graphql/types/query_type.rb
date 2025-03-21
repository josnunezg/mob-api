module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :current_user, resolver: Resolvers::CurrentUserResolver
    field :budgets, resolver: Resolvers::BudgetsConnection
    field :budget, resolver: Resolvers::BudgetResolver
  end
end
