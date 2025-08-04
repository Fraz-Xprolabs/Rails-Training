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


# Adding views and published columns to posts
rails generate migration AddViewsAndPublishedToPosts views:integer published:boolean


# Rollong back 6 migrations
rails db:rollback STEP=6

# Rails Migration Methods for Existing Schema 

# TABLE CREATION
create_table :comments do |t|
  t.text :body
  t.references :post, foreign_key: true
  t.timestamps
end

# ADDING COLUMNS
add_column :posts, :views, :integer (rails g migration AddViewsToPosts)
add_column :users, :bio, :text
add_column :blogs, :published, :boolean, default: false

# REMOVING COLUMNS
remove_column :tags, :color, :string

# RENAMING COLUMNS
rename_column :users, :name, :full_name

# == CHANGING COLUMN TYPES or OPTIONS ==
change_column :posts, :title, :text
change_column_default :blogs, :published, from: false, to: true
change_column_null :categories, :description, false

# == REFERENCES / ASSOCIATIONS ==
add_reference :blogs, :user, foreign_key: true
remove_reference :tags, :post

# INDEXES
add_index :posts, :title
remove_index :tags, :post_id

# FOREIGN KEYS
add_foreign_key :blogs, :users
remove_foreign_key :tags, :posts

# TIMESTAMPS
add_timestamps :categories
remove_timestamps :tags

# JOIN TABLE
create_join_table :posts, :categories
drop_join_table :posts, :categories

# CONSTRAINTS 
add_check_constraint :posts, "char_length(content) > 0", name: "content_presence"
remove_check_constraint :posts, name: "content_presence"

# RENAMING TABLE
rename_table :blogs, :articles

# DROPPING TABLE
drop_table :blogs

# Up and Down Functions
class RemoveViewsFromPosts < ActiveRecord::Migration[8.0]
  def up
    remove_column :posts, :views
  end

  def down
    add_column :posts, :views, :integer
  end
end
