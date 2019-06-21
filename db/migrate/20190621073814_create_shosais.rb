class CreateShosais < ActiveRecord::Migration[5.2]
  def change
    create_table :shosais do |t|
      t.string :name
      t.string :key
      t.integer :value

      t.timestamps
    end
  end
end
