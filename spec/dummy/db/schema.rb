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

ActiveRecord::Schema.define(version: 2019_01_22_103231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "building"
    t.string "street"
    t.string "locality"
    t.string "county"
    t.string "post_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claim_claimants", force: :cascade do |t|
    t.bigint "claim_id"
    t.bigint "claimant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["claim_id"], name: "index_claim_claimants_on_claim_id"
    t.index ["claimant_id"], name: "index_claim_claimants_on_claimant_id"
  end

  create_table "claimants", force: :cascade do |t|
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.bigint "address_id"
    t.string "address_telephone_number"
    t.string "mobile_number"
    t.string "email_address"
    t.string "contact_preference"
    t.string "gender"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_claimants_on_address_id"
  end

  create_table "claims", force: :cascade do |t|
    t.string "reference"
    t.string "submission_reference"
    t.string "submission_channel"
    t.string "case_type"
    t.integer "jurisdiction"
    t.integer "office_code"
    t.datetime "date_of_receipt"
    t.bigint "primary_claimant_id"
    t.integer "claimant_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["primary_claimant_id"], name: "index_claims_on_primary_claimant_id"
  end

  create_table "exports", force: :cascade do |t|
    t.string "resource_type"
    t.bigint "resource_id"
    t.bigint "external_system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_system_id"], name: "index_exports_on_external_system_id"
    t.index ["resource_type", "resource_id"], name: "index_exports_on_resource_type_and_resource_id"
  end

  create_table "external_system_configurations", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.bigint "external_system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_system_id"], name: "index_external_system_configurations_on_external_system_id"
  end

  create_table "external_systems", force: :cascade do |t|
    t.string "name"
    t.string "reference"
    t.integer "office_codes", array: true
    t.boolean "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "claim_claimants", "claimants"
  add_foreign_key "claim_claimants", "claims"
  add_foreign_key "claimants", "addresses"
  add_foreign_key "exports", "external_systems"
  add_foreign_key "external_system_configurations", "external_systems"
end
