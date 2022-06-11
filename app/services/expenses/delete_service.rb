module Expenses
  class DeleteService
    include Interactor

    delegate :id, :user, to: :context

    def call
      context.fail!(error: Error.record_invalid(expense.errors)) unless expense.destroy
      context.result = true
    end

    private

    def expense
      @expense ||= user.expenses.find(id)
    rescue ActiveRecord::RecordNotFound
      context.fail!(error: Error.record_not_found('User::Budget::Expense', 'id', id))
    end
  end
end
