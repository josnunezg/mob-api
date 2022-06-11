module Mutations
  module Expenses
    class CreateExpense < ::Mutations::BaseMutation
      argument :attributes, ExpenseInputObject, required: true
      argument :budget_id, ID, required: true

      type ::Types::ExpenseType, null: false

      def resolve(attributes:, budget_id:)
        service = ::Expenses::CreateService.call(
          user: current_user,
          attributes: attributes.to_h,
          budget_id: budget_id
        )

        handle_service(service)
      end
    end
  end
end
