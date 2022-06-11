module Mutations
  module Incomes
    class CreateIncome < ::Mutations::BaseMutation
      argument :attributes, IncomeInputObject, required: true
      argument :account_id, ID, required: true

      type ::Types::IncomeType, null: false

      def resolve(attributes:, account_id:)
        service = ::Incomes::CreateService.call(
          user: current_user,
          attributes: attributes.to_h,
          account_id: account_id
        )

        handle_service(service)
      end
    end
  end
end
