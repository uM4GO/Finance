class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.string :description
      t.decimal :amount
      t.string :transaction_type
      t.datetime :date
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
