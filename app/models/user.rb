class User < ApplicationRecord
  has_secure_password

  has_many :budgets
  has_many :accounts, through: :budgets
  has_many :expense, through: :budgets
  has_many :incomes, through: :accounts
end
