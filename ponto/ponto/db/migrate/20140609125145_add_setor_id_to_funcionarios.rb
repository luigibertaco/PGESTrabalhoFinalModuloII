class AddSetorIdToFuncionarios < ActiveRecord::Migration
  def change
    add_reference :funcionarios, :setor, index: true
  end
end
