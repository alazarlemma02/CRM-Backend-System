class CreateOfferTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :offer_types do |t|
      t.string :offer_type_name, null: false

      t.timestamps
    end
    add_index :offer_types, :offer_type_name, unique: true
  end
end
