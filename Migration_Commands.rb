# rails generate model Category name:string description:text
# rails db:migrate
# cat db/schema.rb


# TEST IN CONSOLE

# rails console

# Creating Category Rows
Category.create(name: "Science", description: "Books related to science and discovery")
Category.create(name: "Philosophy", description: "Books on philosophical thought")
Category.all.pluck(:name)

# Create Table form migration
rails generate migration CreateTags name:string color:string

# Adding column from migration
rails generate migration AddPriorityToTags priority:integer

# Remove column from migration
rails generate migration RemovePriorityFromTags priority:integer

# Adding association bw tags and posts
rails generate migration AddPostRefToTags post:references

# Updating hte migration by cutom name to id
class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags, primary_key: "tag_id" do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
