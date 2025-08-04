class RemoveViewsFromPosts < ActiveRecord::Migration[8.0]
  def up
    remove_column :posts, :views
  end

  def down
    add_column :posts, :views, :integer
  end
end
