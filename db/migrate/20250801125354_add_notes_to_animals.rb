class AddNotesToAnimals < ActiveRecord::Migration[8.0]
  def change
    add_column :animals, :notes, :text
  end
end
