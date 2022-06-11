module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_budget, mutation: ::Mutations::Budgets::CreateBudget
    field :create_category, mutation: ::Mutations::Categories::CreateCategory

    field :create_account, mutation: ::Mutations::Accounts::CreateAccount
    field :update_account, mutation: ::Mutations::Accounts::UpdateAccount
    field :delete_account, mutation: ::Mutations::Accounts::DeleteAccount

    field :create_expense, mutation: ::Mutations::Expenses::CreateExpense
    field :update_expense, mutation: ::Mutations::Expenses::UpdateExpense
    field :delete_expense, mutation: ::Mutations::Expenses::DeleteExpense

    field :create_income, mutation: ::Mutations::Incomes::CreateIncome
    field :update_income, mutation: ::Mutations::Incomes::UpdateIncome
    field :delete_income, mutation: ::Mutations::Incomes::DeleteIncome
  end
end
