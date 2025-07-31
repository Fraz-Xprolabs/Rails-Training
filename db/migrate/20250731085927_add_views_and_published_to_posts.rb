class AddViewsAndPublishedToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :views, :integer
    add_column :posts, :published, :boolean
  end
end
