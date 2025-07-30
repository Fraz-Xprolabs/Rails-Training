class AddPriorityToTags < ActiveRecord::Migration[8.0]
  def change
    add_column :tags, :priority, :integer
  end
end
