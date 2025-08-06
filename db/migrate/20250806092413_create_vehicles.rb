class CreateVehicles < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.integer :wheels
      t.string :type

      t.timestamps
    end
  end
end
