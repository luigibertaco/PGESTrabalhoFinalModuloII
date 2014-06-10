class AddTipoAndSetorToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :tipo, :integer
    add_reference :usuarios, :setor, index: true
  end
end
