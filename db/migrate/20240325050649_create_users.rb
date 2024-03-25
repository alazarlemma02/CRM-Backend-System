# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :profile_picture
      t.string :password_digest, null: false
      t.references :address, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.integer :user_type, null: false, default: 1
      t.date :date_of_birth
      t.string :user_name, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :user_name, unique: true
  end
end
