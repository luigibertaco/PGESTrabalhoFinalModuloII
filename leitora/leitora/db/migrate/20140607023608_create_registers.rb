class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.date :data
      t.time :hora
      t.integer :funcionario

      t.timestamps
    end
  end
end
