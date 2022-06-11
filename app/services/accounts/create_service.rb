module Accounts
  class CreateService
    include Interactor

    delegate :attributes, :budget_id, :user, to: :context

    def call
      account = budget.accounts.new(attributes)
      context.fail!(error: Error.record_invalid(account.errors)) unless account.save
      context.result = account
    end

    private

    def budget
      @budget ||= users.budgets.find(budget_id)
    rescue ActiveRecord::RecordNotFound
      context.fail!(error: Error.record_not_found('User::Budget', 'id', budget_id))
    end
  end
end
