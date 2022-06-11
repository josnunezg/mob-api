module Mutations
  module Budgets
    class CreateBudget < ::Mutations::BaseMutation
      argument :attributes, BudgetInputObject, required: true

      type ::Types::BudgetType, null: false

      def resolve(attributes:)
        service = ::Budgets::CreateService.call(
          user: context[:current_user],
          params: attributes.to_h
        )

        handle_service(service)
      end
    end
  end
end
