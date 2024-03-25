# frozen_string_literal: true

class CreateOfferings < ActiveRecord::Migration[7.1]
  def change
    create_table :offerings do |t|
      t.string :offer_title, null: false
      t.text :offer_description, null: false
      t.datetime :offer_start_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :offer_end_date, null: false
      t.references :product, null: false, foreign_key: true
      t.references :offer_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
