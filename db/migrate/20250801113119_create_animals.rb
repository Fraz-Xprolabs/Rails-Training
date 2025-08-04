class CreateAnimals < ActiveRecord::Migration[8.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.integer :age
      t.float :weight
      t.string :gender
      t.boolean :endangered
      t.string :habitat
      t.string :tag_id

      t.timestamps
    end
  end
end
