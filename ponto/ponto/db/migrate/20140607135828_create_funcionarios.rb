class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.integer :codigo
      t.string :nome
      t.boolean :ativo

      t.timestamps
    end
  end
end
