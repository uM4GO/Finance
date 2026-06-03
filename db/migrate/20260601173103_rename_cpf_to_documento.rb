class RenameCpfToDocumento < ActiveRecord::Migration[8.1]
  def change
    rename_column :customers, :cpf, :documento
  end
end
