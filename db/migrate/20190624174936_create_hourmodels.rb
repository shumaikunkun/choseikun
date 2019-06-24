class CreateHourmodels < ActiveRecord::Migration[5.2]
  def change
    create_table :hourmodels do |t|
      t.string :hour
      t.integer :num

      t.timestamps
    end
  end
end
