class CreateDaymodels < ActiveRecord::Migration[5.2]
  def change
    create_table :daymodels do |t|
      t.string :day
      t.integer :num

      t.timestamps
    end
  end
end
