class CreateFeria < ActiveRecord::Migration
  def change
    create_table :feria do |t|
      t.references :funcionario, index: true
      t.date :data_inicio
      t.date :data_fim

      t.timestamps
    end
  end
end
