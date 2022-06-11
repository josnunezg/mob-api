module Mutations
  module Expenses
    class DeleteExpense < ::Mutations::BaseMutation
      argument :id, ID, required: true

      type ::GraphQL::Types::Boolean

      def resolve(id:)
        service = ::Expenses::DeleteService.call(user: current_user, id: id)

        handle_service(service)
      end
    end
  end
end
