class RemoveCodigo2FromFuncionarios < ActiveRecord::Migration
  def up
  	remove_column :funcionarios, :codigo
  end

  def down
  	add_column :funcionarios, :codigo, :integer
  end
end
