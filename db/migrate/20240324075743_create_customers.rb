class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :customer_name, null: false
      t.string :customer_mobile
      t.string :customer_email, null: false
      t.string :customer_profile_picture
      t.string :password_digest, null: false
      t.references :address, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
    add_index :customers, :customer_email, unique: true
  end
end
