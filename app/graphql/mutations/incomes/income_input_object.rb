module Mutations
  module Incomes
    class IncomeInputObject < ::Types::BaseInputObject
      argument :note, String, required: false
      argument :amount, Int, required: false
      argument :perceived_at, ::GraphQL::Types::ISO8601Date, required: false
    end
  end
end
