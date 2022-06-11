module Budgets
  class CreateService
    include Interactor

    delegate :user, :params, to: :context

    def call
      budget = user.budgets.new(params)
      context.fail!(error: Error.record_invalid(budget.errors)) unless budget.save
      context.result = budget
    end
  end
end
