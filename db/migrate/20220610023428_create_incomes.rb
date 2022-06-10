class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.text :note
      t.integer :amount
      t.belongs_to :account, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
