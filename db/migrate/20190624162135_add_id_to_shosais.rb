class AddIdToShosais < ActiveRecord::Migration[5.2]
  def change
    add_column :shosais, :num, :int
  end
end
