module Expenses
  class CreateService
    include Interactor

    delegate :attributes, :budget_id, :user, to: :context

    def call
      expense = budget.expenses.new(attributes)
      context.fail!(error: Error.record_invalid(expense.errors)) unless expense.save
      context.result = expense
    end

    private

    def budget
      @budget ||= user.budgets.find(budget_id)
    rescue ActiveRecord::RecordNotFound
      context.fail!(error: Error.record_not_found('User::Budget', 'id', budget_id))
    end
  end
end
