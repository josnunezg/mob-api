class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :budget
end
