module Budgets
  class FindService
    include Interactor

    delegate :id, :user, to: :context

    def call
      context.fail!(error: Error.record_not_found('Budget', 'id', id)) if budget.nil?
      context.result = budget
    end

    private

    def budget
      @budget ||= user.budgets.find_by(id: id)
    end
  end
end
