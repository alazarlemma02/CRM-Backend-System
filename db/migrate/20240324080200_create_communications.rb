class CreateCommunications < ActiveRecord::Migration[7.1]
  def change
    create_table :communications do |t|
      t.string :communication_type, null: false
      t.datetime :communication_datetime, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.text :communication_content, null: false
      t.references :customer, null: false, foreign_key: true
      t.references :salesman, null: false, foreign_key: true

      t.timestamps
    end
  end
end
