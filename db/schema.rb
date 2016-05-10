# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160324120959) do

  create_table "blogs", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.binary   "content",    limit: 4294967295
    t.integer  "lugref",     limit: 4,          null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", primary_key: "customerNumber", force: :cascade do |t|
    t.string  "customerName",           limit: 50, null: false
    t.string  "contactLastName",        limit: 50, null: false
    t.string  "contactFirstName",       limit: 50, null: false
    t.string  "phone",                  limit: 50, null: false
    t.string  "addressLine1",           limit: 50, null: false
    t.string  "addressLine2",           limit: 50
    t.string  "city",                   limit: 50, null: false
    t.string  "state",                  limit: 50
    t.string  "postalCode",             limit: 15
    t.string  "country",                limit: 50, null: false
    t.integer "salesRepEmployeeNumber", limit: 4
    t.float   "creditLimit",            limit: 53
  end

  add_index "customers", ["salesRepEmployeeNumber"], name: "salesRepEmployeeNumber", using: :btree

  create_table "employees", primary_key: "employeeNumber", force: :cascade do |t|
    t.string  "lastName",   limit: 50,  null: false
    t.string  "firstName",  limit: 50,  null: false
    t.string  "extension",  limit: 10,  null: false
    t.string  "email",      limit: 100, null: false
    t.string  "officeCode", limit: 10,  null: false
    t.integer "reportsTo",  limit: 4
    t.string  "jobTitle",   limit: 50,  null: false
  end

  add_index "employees", ["officeCode"], name: "officeCode", using: :btree
  add_index "employees", ["reportsTo"], name: "reportsTo", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.string   "product_id", limit: 255,               null: false
    t.text     "cart_id",    limit: 65535,             null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "quantity",   limit: 4,     default: 1
  end

  create_table "lugs", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "post1",      limit: 16777215
    t.text     "post2",      limit: 65535
    t.text     "post3",      limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "offices", primary_key: "officeCode", force: :cascade do |t|
    t.string "city",         limit: 50, null: false
    t.string "phone",        limit: 50, null: false
    t.string "addressLine1", limit: 50, null: false
    t.string "addressLine2", limit: 50
    t.string "state",        limit: 50
    t.string "country",      limit: 50, null: false
    t.string "postalCode",   limit: 15, null: false
    t.string "territory",    limit: 10, null: false
  end

  create_table "orderdetails", id: false, force: :cascade do |t|
    t.integer "orderNumber",     limit: 4,  null: false
    t.string  "productCode",     limit: 15, null: false
    t.integer "quantityOrdered", limit: 4,  null: false
    t.float   "priceEach",       limit: 53, null: false
    t.integer "orderLineNumber", limit: 2,  null: false
  end

  add_index "orderdetails", ["productCode"], name: "productCode", using: :btree

  create_table "orders", primary_key: "orderNumber", force: :cascade do |t|
    t.date    "orderDate",                    null: false
    t.date    "requiredDate",                 null: false
    t.date    "shippedDate"
    t.string  "status",         limit: 15,    null: false
    t.text    "comments",       limit: 65535
    t.integer "customerNumber", limit: 4,     null: false
  end

  add_index "orders", ["customerNumber"], name: "customerNumber", using: :btree

  create_table "payments", id: false, force: :cascade do |t|
    t.integer "customerNumber", limit: 4,  null: false
    t.string  "checkNumber",    limit: 50, null: false
    t.date    "paymentDate",               null: false
    t.float   "amount",         limit: 53, null: false
  end

  create_table "productlines", primary_key: "productLine", force: :cascade do |t|
    t.string "textDescription", limit: 4000
    t.text   "htmlDescription", limit: 16777215
    t.binary "image",           limit: 16777215
  end

  create_table "products", primary_key: "productCode", force: :cascade do |t|
    t.string  "productName",        limit: 70,    null: false
    t.string  "productLine",        limit: 50,    null: false
    t.string  "productScale",       limit: 10,    null: false
    t.string  "productVendor",      limit: 50,    null: false
    t.text    "productDescription", limit: 65535, null: false
    t.integer "quantityInStock",    limit: 2,     null: false
    t.float   "buyPrice",           limit: 53,    null: false
    t.float   "MSRP",               limit: 53,    null: false
    t.string  "productImage",       limit: 255,   null: false
  end

  add_index "products", ["productLine"], name: "productLine", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "web_customers", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "firstName",    limit: 255
    t.string   "lastName",     limit: 255
    t.string   "phone",        limit: 255
    t.string   "addressLine1", limit: 255
    t.string   "addressLine2", limit: 255
    t.string   "city",         limit: 255
    t.string   "state",        limit: 255
    t.string   "postalcode",   limit: 255
    t.string   "country",      limit: 255
    t.string   "email",        limit: 255
  end

  create_table "web_order_details", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "orderNumber",     limit: 4
    t.string   "productCode",     limit: 255
    t.integer  "quantityOrdered", limit: 4
    t.integer  "buyPrice",        limit: 4
    t.integer  "orderLineNumber", limit: 4
  end

  create_table "web_orders", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "orderNumber",    limit: 4
    t.date     "orderDate"
    t.date     "shippedDate"
    t.string   "status",         limit: 255
    t.integer  "customerNumber", limit: 4
  end

  add_foreign_key "customers", "employees", column: "salesRepEmployeeNumber", primary_key: "employeeNumber", name: "customers_ibfk_1"
  add_foreign_key "employees", "employees", column: "reportsTo", primary_key: "employeeNumber", name: "employees_ibfk_1"
  add_foreign_key "employees", "offices", column: "officeCode", primary_key: "officeCode", name: "employees_ibfk_2"
  add_foreign_key "orderdetails", "orders", column: "orderNumber", primary_key: "orderNumber", name: "orderdetails_ibfk_1"
  add_foreign_key "orderdetails", "products", column: "productCode", primary_key: "productCode", name: "orderdetails_ibfk_2"
  add_foreign_key "orders", "customers", column: "customerNumber", primary_key: "customerNumber", name: "orders_ibfk_1"
  add_foreign_key "payments", "customers", column: "customerNumber", primary_key: "customerNumber", name: "payments_ibfk_1"
  add_foreign_key "products", "productlines", column: "productLine", primary_key: "productLine", name: "products_ibfk_1"
end
