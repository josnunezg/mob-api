module Mutations
  module Categories
    class CreateCategory < ::Mutations::BaseMutation
      argument :name, String, required: true

      type ::Types::CategoryType, null: false

      def resolve(name:)
        service = ::Categories::CreateService.call(name: name)

        handle_service(service)
      end
    end
  end
end
