module Mutations
  module Accounts
    class UpdateAccount < ::Mutations::BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: true

      type ::Types::AccountType, null: false

      def resolve(name:, id:)
        service = ::Accounts::UpdateService.call(
          attributes: { name: name }, id: id, user: current_user
        )

        handle_service(service)
      end
    end
  end
end
