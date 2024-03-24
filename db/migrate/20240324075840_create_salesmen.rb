class CreateSalesmen < ActiveRecord::Migration[7.1]
  def change
    create_table :salesmen do |t|
      t.string :salesman_name, null: false
      t.string :salesman_mobile
      t.string :salesman_email, null: false
      t.string :salesman_profile_picture
      t.string :password_digest, null: false
      t.references :address, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
    add_index :salesmen, :salesman_email, unique: true
  end
end
