class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :address
      t.date :birth_date
      t.string :cpf, limit: 14
      t.string :kind, limit: 1
      t.string :cep, limit: 9
      t.boolean :active

      t.timestamps
    end
  end
end
