class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags, primary_key: "tag_id" do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
