class CreateUserFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :user_feedbacks do |t|
      t.string :feedback_title, null: false
      t.string :feedback_content, null: false
      t.datetime :feedback_datetime, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
