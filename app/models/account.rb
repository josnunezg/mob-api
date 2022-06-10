class Account < ApplicationRecord
  belongs_to :budget

  has_many :incomes
end
