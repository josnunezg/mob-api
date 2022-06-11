module Types
  class ExpenseType < BaseObject
    field :id, ID, null: false
    field :note, String
    field :amount, Int
    field :perceived_at, ::GraphQL::Types::ISO8601Date
    field :category, CategoryType
    field :created_at, ::GraphQL::Types::ISO8601DateTime
    field :updated_at, ::GraphQL::Types::ISO8601DateTime
  end
end
