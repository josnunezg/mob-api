module Mutations
  module Expenses
    class ExpenseInputObject < ::Types::BaseInputObject
      argument :note, String, required: false
      argument :amount, Int, required: false
      argument :perceived_at, ::GraphQL::Types::ISO8601Date, required: false
      argument :category_id, ID, required: false
    end
  end
end
