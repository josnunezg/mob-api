module Mutations
  module Budgets
    class BudgetInputObject < ::Types::BaseInputObject
      description 'Attributes for creating or updating a budget'

      argument :name, String, required: true
      argument :description, String
    end
  end
end
