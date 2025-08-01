class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :middle_name
      t.string :email
      t.string :email_confirmation
      t.string :username
      t.string :role
      t.integer :age
      t.date :date_of_birth
      t.string :admin_code
      t.boolean :terms_of_service
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :credit_card_number
      t.datetime :subscription_expires_at

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
