class Budget < ApplicationRecord
  belongs_to :user

  has_many :accounts
  has_many :expenses
  has_many :incomes, through: :accounts
end
