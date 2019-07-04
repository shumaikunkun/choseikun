class CreateHashers < ActiveRecord::Migration[5.2]
  def change
    create_table :hashers do |t|
      t.string :random
      t.integer :num

      t.timestamps
    end
  end
end
