module Mutations
  module Incomes
    class UpdateIncome < ::Mutations::BaseMutation
      argument :attributes, IncomeInputObject, required: true
      argument :id, ID, required: true

      type ::Types::IncomeType, null: false

      def resolve(attributes:, id:)
        service = ::Incomes::UpdateService.call(
          user: current_user,
          id: id,
          attributes: attributes.to_h
        )

        handle_service(service)
      end
    end
  end
end
