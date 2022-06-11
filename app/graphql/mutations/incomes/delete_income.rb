module Mutations
  module Incomes
    class DeleteIncome < ::Mutations::BaseMutation
      argument :id, ID, required: true

      type ::GraphQL::Types::Boolean

      def resolve(id:)
        service = ::Incomes::DeleteService.call(user: current_user, id: id)

        handle_service(service)
      end
    end
  end
end
