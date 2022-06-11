module Resolvers
  class BudgetsConnection < Base
    type ::Types::BudgetType.connection_type, null: true

    def resolve
      context[:current_user].budgets
    end
  end
end
