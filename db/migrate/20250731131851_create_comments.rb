class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :content
      t.boolean :liked
      t.integer :no_of_replies

      t.timestamps
    end
  end
end
