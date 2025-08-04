class ChangeTitleTypeToText < ActiveRecord::Migration[8.0]
  def change
    change_column :blogs, :title, :text
    rename_column :categories, :description, :details
    remove_column :tags, :color, :string
    rename_table :blogs, :articles
    add_index :posts, :title
    remove_index :tags, :post_id
    change_column :posts, :title, :text
    change_column_null :categories, :details, false
    remove_reference :tags, :post
    add_check_constraint :posts, 'char_length(title) > 3', name: 'title_length_check'

    # Creating Join Table
    create_join_table :posts, :categories do |t|
      t.index :post_id
      t.index :category_id
    end

    change_column_default :posts, :views, from: nil, to: 0
    change_column_null :users, :email, false
    remove_timestamps :categories
  end
end
