class CreateBatidas < ActiveRecord::Migration
  def change
    create_table :batidas do |t|
      t.references :funcionario, index: true
      t.date :data
      t.time :hora

      t.timestamps
    end
  end
end
