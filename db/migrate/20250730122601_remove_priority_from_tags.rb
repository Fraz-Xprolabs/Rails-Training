class RemovePriorityFromTags < ActiveRecord::Migration[8.0]
  def change
    remove_column :tags, :priority, :integer
  end
end
