class CreateDivergencia < ActiveRecord::Migration
  def change
    create_table :divergencia do |t|
      t.date :data
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
