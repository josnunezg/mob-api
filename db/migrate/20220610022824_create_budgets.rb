class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :name, null: false
      t.text :description
      t.belongs_to :user, null: false, foreign_key: true, index: true

      t.timestamps
    end

    add_index :budgets, :name
  end
end
