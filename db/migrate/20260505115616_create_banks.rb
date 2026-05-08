class CreateBanks < ActiveRecord::Migration[8.1]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :code, limit: 3
      t.boolean :active, default: true
      
      t.timestamps
    end
  end
end
