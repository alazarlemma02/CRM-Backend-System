class CreateProductCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :product_categories do |t|
      t.string :product_category_name, null: false

      t.timestamps
    end
    add_index :product_categories, :product_category_name, unique: true
  end
end
