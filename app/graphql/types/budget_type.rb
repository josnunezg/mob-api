module Types
  class BudgetType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :created_at, ::GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, ::GraphQL::Types::ISO8601DateTime, null: false
    field :total_incomes, Int, null: false
    field :total_expenses, Int, null: false
    field :accounts, [::Types::AccountType, { null: true }], null: true
    field :expenses, ::Types::ExpenseType.connection_type, null: true
    field :incomes, ::Types::IncomeType.connection_type, null: true
  end
end
