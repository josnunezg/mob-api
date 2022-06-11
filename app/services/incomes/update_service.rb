module Incomes
  class UpdateService
    include Interactor

    delegate :id, :user, :attributes, to: :context

    def call
      context.fail!(error: Error.record_invalid(income.errors)) unless income.update(attributes)
      context.result = income
    end

    private

    def income
      @income ||= user.incomes.find(id)
    rescue ActiveRecord::RecordNotFound
      context.fail!(error: Error.record_not_found('User::Budget::Account::Income', 'id', id))
    end
  end
end
