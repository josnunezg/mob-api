module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String
    field :email, String, null: false
    field :created_at, ::GraphQL::Types::ISO8601DateTime
    field :updated_at, ::GraphQL::Types::ISO8601DateTime
  end
end
