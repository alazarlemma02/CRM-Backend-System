# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :region, null: false
      t.string :city, null: false
      t.string :state
      t.string :postal_code
      t.string :country, null: false

      t.timestamps
    end
  end
end
