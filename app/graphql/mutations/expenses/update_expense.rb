module Mutations
  module Expenses
    class UpdateExpense < ::Mutations::BaseMutation
      argument :attributes, ExpenseInputObject, required: true
      argument :id, ID, required: true

      type ::Types::ExpenseType, null: false

      def resolve(attributes:, id:)
        service = ::Expenses::UpdateService.call(
          user: current_user,
          id: id,
          attributes: attributes.to_h
        )

        handle_service(service)
      end
    end
  end
end
