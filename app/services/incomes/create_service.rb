module Incomes
  class CreateService
    include Interactor

    delegate :attributes, :account_id, :user, to: :context

    def call
      income = account.incomes.new(attributes)
      context.fail!(error: Error.record_invalid(income.errors)) unless income.save
      context.result = income
    end

    private

    def account
      @account ||= user.accounts.find(account_id)
    rescue ActiveRecord::RecordNotFound
      context.fail!(error: Error.record_not_found('User::Budget::Account', 'id', account_id))
    end
  end
end
