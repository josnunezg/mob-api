class Account < ApplicationRecord
  belongs_to :budget

  has_many :incomes

  scope :by_user, ->(user_id) { joins(:budget).where(budget: { user_id: user_id }) }
end
