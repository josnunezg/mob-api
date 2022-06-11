module Mutations
  module Accounts
    class CreateAccount < ::Mutations::BaseMutation
      argument :name, String, required: true
      argument :budget_id, ID, required: true

      type ::Types::AccountType, null: false

      def resolve(name:, budget_id:)
        service = ::Accounts::CreateService.call(
          attributes: { name: name }, budget_id: budget_id, user: current_user
        )

        handle_service(service)
      end
    end
  end
end
