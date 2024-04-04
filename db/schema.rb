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

ActiveRecord::Schema[7.1].define(version: 2024_04_04_110233) do
  create_table "addresses", force: :cascade do |t|
    t.string "region", null: false
    t.string "city", null: false
    t.string "state"
    t.string "postal_code"
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communications", force: :cascade do |t|
    t.string "communication_type", null: false
    t.datetime "communication_datetime", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text "communication_content", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_communications_on_user_id"
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
    t.integer "product_id", null: false
    t.integer "offer_type_id", null: false
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
    t.integer "user_id", null: false
    t.integer "product_id", null: false
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
    t.float "product_rating"
    t.text "product_description"
    t.string "product_image"
    t.integer "product_quantity_count", null: false
    t.integer "product_type_id", null: false
    t.integer "product_category_id", null: false
    t.integer "product_quantity_type_id", null: false
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
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_feedbacks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "profile_picture"
    t.string "password_digest", null: false
    t.integer "address_id", null: false
    t.integer "role_id", null: false
    t.integer "user_type", default: 1, null: false
    t.date "date_of_birth"
    t.string "user_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "communications", "users"
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
