class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :message, null: false, foreign_key: true
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end
