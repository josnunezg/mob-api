module Incomes
  class DeleteService
    include Interactor

    delegate :id, :user, to: :context

    def call
      context.fail!(error: Error.record_invalid(income.errors)) unless income.destroy
      context.result = true
    end

    private

    def income
      @income ||= user.incomes.find(id)
    rescue ActiveRecord::RecordNotFound
      context.fail!(error: Error.record_not_found('User::Budget::Account::Income', 'id', id))
    end
  end
end
