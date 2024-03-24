class CreateCustomerFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_feedbacks do |t|
      t.string :feedback_title, null: false
      t.text :feedback_comment, null: false
      t.datetime :feedback_datetime, null: false
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
