# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string :role_name, null: false

      t.timestamps
    end
    add_index :roles, :role_name, unique: true
  end
end
