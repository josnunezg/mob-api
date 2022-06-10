class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.text :note
      t.integer :amount
      t.belongs_to :category, null: false, foreign_key: true, index: true
      t.belongs_to :budget, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
