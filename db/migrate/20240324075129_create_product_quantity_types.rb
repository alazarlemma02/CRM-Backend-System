class CreateProductQuantityTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :product_quantity_types do |t|
      t.string :product_quantity_type, null: false

      t.timestamps
    end
    add_index :product_quantity_types, :product_quantity_type, unique: true
  end
end
