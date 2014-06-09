class CreateFeriasFuncionarios < ActiveRecord::Migration
  def change
    create_table :ferias_funcionarios do |t|
      t.references :funcionario, index: true
      t.date :data_inicio
      t.date :data_fim

      t.timestamps
    end
  end
end
