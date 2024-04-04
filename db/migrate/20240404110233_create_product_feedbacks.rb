class CreateProductFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :product_feedbacks do |t|
      t.string :feedback_content, null: false
      t.datetime :feedback_datetime, default: -> { 'CURRENT_TIMESTAMP' }
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
