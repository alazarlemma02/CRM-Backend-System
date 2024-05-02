# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_25_085444) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "region", null: false
    t.string "city", null: false
    t.string "state"
    t.string "postal_code"
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content", null: false
    t.boolean "status", default: false, null: false
    t.bigint "sender_id", null: false
    t.bigint "recipient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "message_id", null: false
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_notifications_on_message_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "offer_types", force: :cascade do |t|
    t.string "offer_type_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_type_name"], name: "index_offer_types_on_offer_type_name", unique: true
  end

  create_table "offerings", force: :cascade do |t|
    t.string "offer_title", null: false
    t.text "offer_description", null: false
    t.datetime "offer_start_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "offer_end_date", null: false
    t.bigint "product_id", null: false
    t.bigint "offer_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_type_id"], name: "index_offerings_on_offer_type_id"
    t.index ["product_id"], name: "index_offerings_on_product_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "product_category_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_name"], name: "index_product_categories_on_product_category_name", unique: true
  end

  create_table "product_feedbacks", force: :cascade do |t|
    t.string "feedback_content", null: false
    t.datetime "feedback_datetime", default: -> { "CURRENT_TIMESTAMP" }
    t.float "product_rating"
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_feedbacks_on_product_id"
    t.index ["user_id"], name: "index_product_feedbacks_on_user_id"
  end

  create_table "product_quantity_types", force: :cascade do |t|
    t.string "product_quantity_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_quantity_type"], name: "index_product_quantity_types_on_product_quantity_type", unique: true
  end

  create_table "product_types", force: :cascade do |t|
    t.string "product_type_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_type_name"], name: "index_product_types_on_product_type_name", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name", null: false
    t.decimal "product_price", null: false
    t.text "product_description"
    t.float "average_rating", default: 0.0
    t.integer "product_quantity_count", null: false
    t.bigint "product_type_id", null: false
    t.bigint "product_category_id", null: false
    t.bigint "product_quantity_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["product_quantity_type_id"], name: "index_products_on_product_quantity_type_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_name"], name: "index_roles_on_role_name", unique: true
  end

  create_table "user_feedbacks", force: :cascade do |t|
    t.string "feedback_title", null: false
    t.string "feedback_content", null: false
    t.datetime "feedback_datetime", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_feedbacks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "password_digest", null: false
    t.bigint "address_id", null: false
    t.bigint "role_id", null: false
    t.integer "user_type", default: 0, null: false
    t.date "date_of_birth"
    t.string "user_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "messages", "users", column: "recipient_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "notifications", "messages"
  add_foreign_key "notifications", "users"
  add_foreign_key "offerings", "offer_types"
  add_foreign_key "offerings", "products"
  add_foreign_key "product_feedbacks", "products"
  add_foreign_key "product_feedbacks", "users"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "product_quantity_types"
  add_foreign_key "products", "product_types"
  add_foreign_key "user_feedbacks", "users"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "roles"
end
