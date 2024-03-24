class CreateProductTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :product_types do |t|
      t.string :product_type_name, null: false

      t.timestamps
    end
    add_index :product_types, :product_type_name, unique: true
  end
end
