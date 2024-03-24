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

ActiveRecord::Schema[7.1].define(version: 2024_03_24_080200) do
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
    t.integer "customer_id", null: false
    t.integer "salesman_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_communications_on_customer_id"
    t.index ["salesman_id"], name: "index_communications_on_salesman_id"
  end

  create_table "customer_feedbacks", force: :cascade do |t|
    t.string "feedback_title", null: false
    t.text "feedback_comment", null: false
    t.datetime "feedback_datetime", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_feedbacks_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_name", null: false
    t.string "customer_mobile"
    t.string "customer_email", null: false
    t.string "customer_profile_picture"
    t.string "password_digest", null: false
    t.integer "address_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["customer_email"], name: "index_customers_on_customer_email", unique: true
    t.index ["role_id"], name: "index_customers_on_role_id"
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

  create_table "salesmen", force: :cascade do |t|
    t.string "salesman_name", null: false
    t.string "salesman_mobile"
    t.string "salesman_email", null: false
    t.string "salesman_profile_picture"
    t.string "password_digest", null: false
    t.integer "address_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_salesmen_on_address_id"
    t.index ["role_id"], name: "index_salesmen_on_role_id"
    t.index ["salesman_email"], name: "index_salesmen_on_salesman_email", unique: true
  end

  add_foreign_key "communications", "customers"
  add_foreign_key "communications", "salesmen"
  add_foreign_key "customer_feedbacks", "customers"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "roles"
  add_foreign_key "offerings", "offer_types"
  add_foreign_key "offerings", "products"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "product_quantity_types"
  add_foreign_key "products", "product_types"
  add_foreign_key "salesmen", "addresses"
  add_foreign_key "salesmen", "roles"
end
