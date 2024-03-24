class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.decimal :product_price, null: false
      t.float :product_rating
      t.text :product_description
      t.string :product_image
      t.integer :product_quantity_count, null: false
      t.references :product_type, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true
      t.references :product_quantity_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
