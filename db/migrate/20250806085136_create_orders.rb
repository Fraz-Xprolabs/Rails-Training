class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.decimal :amount

      t.timestamps
    end
  end
end
