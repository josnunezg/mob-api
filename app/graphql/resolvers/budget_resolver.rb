module Resolvers
  class BudgetResolver < Base
    argument :id, ID, required: true

    type ::Types::BudgetType, null: false

    def resolve(id:)
      service = ::Budgets::FindService.call(id: id, user: context[:current_user])

      handle_service(service)
    end
  end
end
