module Expenses
  class UpdateService
    include Interactor

    delegate :id, :user, :attributes, to: :context

    def call
      context.fail!(error: Error.record_invalid(expense.errors)) unless expense.update(attributes)
      context.result = expense
    end

    private

    def expense
      @expense ||= user.expenses.find(id)
    rescue ActiveRecord::RecordNotFound
      context.fail!(error: Error.record_not_found('User::Budget::Expense', 'id', id))
    end
  end
end
