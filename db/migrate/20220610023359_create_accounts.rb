class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.belongs_to :budget, null: false, foreign_key: true, index: true

      t.timestamps
    end

    add_index :accounts, :name
  end
end
