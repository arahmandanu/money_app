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

ActiveRecord::Schema[7.1].define(version: 2024_09_24_130922) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auths", force: :cascade do |t|
    t.integer "auth_able_id"
    t.string "auth_able_type"
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchased_stock_logs", force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type"
    t.string "identifier", null: false
    t.integer "total_purchase_item"
    t.jsonb "product", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seed_migration_data_migrations", id: :serial, force: :cascade do |t|
    t.string "version"
    t.integer "runtime"
    t.datetime "migrated_on", precision: nil
  end

  create_table "tokenizers", force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "unq_email", unique: true
  end

  create_table "wallet_transaction_logs", force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type"
    t.decimal "total", precision: 30, scale: 10
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type"
    t.decimal "total", precision: 30, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
