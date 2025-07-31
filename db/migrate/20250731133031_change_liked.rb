class ChangeLiked < ActiveRecord::Migration[8.0]
  def up
    change_column :comments, :liked, :string
  end  

  def down
    change_column :comments, :liked, :text
  end
end