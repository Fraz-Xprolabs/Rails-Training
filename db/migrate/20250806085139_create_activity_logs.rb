class CreateActivityLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :activity_logs do |t|
      t.string :action
      t.references :trackable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
