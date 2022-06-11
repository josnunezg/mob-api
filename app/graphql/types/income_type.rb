module Types
  class IncomeType < BaseObject
    field :id, ID, null: false
    field :amount, Int
    field :note, String
    field :perceived_at, ::GraphQL::Types::ISO8601Date
    field :account, AccountType
    field :created_at, ::GraphQL::Types::ISO8601DateTime
    field :updated_at, ::GraphQL::Types::ISO8601DateTime
  end
end
