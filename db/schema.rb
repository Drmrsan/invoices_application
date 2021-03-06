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

ActiveRecord::Schema.define(version: 20170404211834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "website"
    t.string   "address"
    t.string   "postal_code"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.integer  "user_id"
    t.integer  "invoice_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "company_name"
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "invoice_number"
    t.string   "currency"
    t.date     "date"
    t.string   "invoice_due"
    t.integer  "item_id"
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "tax"
    t.text     "invoice_note"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "subtotal"
    t.integer  "total"
  end

  create_table "items", force: :cascade do |t|
    t.text     "name"
    t.integer  "qty"
    t.decimal  "rate",       precision: 15, scale: 2
    t.decimal  "amount",     precision: 15, scale: 2
    t.integer  "invoice_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["invoice_id"], name: "index_items_on_invoice_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "website"
    t.string   "address"
    t.string   "postal_code"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.string   "company_logo"
    t.string   "company_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "items", "invoices"
end
