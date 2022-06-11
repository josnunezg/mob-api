module Mutations
  module Accounts
    class DeleteAccount < ::Mutations::BaseMutation
      argument :id, ID, required: true

      type ::GraphQL::Types::Boolean, null: false

      def resolve(id:)
        service = ::Accounts::DeleteService.call(
          id: id, user: current_user
        )

        handle_service(service)
      end
    end
  end
end
