class CreateFeriados < ActiveRecord::Migration
  def change
    create_table :feriados do |t|
      t.string :descricao
      t.date :data

      t.timestamps
    end
  end
end
