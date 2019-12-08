# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_05_043503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "character_class"
    t.integer "level"
    t.string "background"
    t.string "race"
    t.string "alignment"
    t.integer "experience"
    t.integer "armor_class"
    t.integer "initiative"
    t.integer "speed"
    t.integer "max_hp"
    t.integer "current_hp"
    t.integer "temporary_hp"
    t.integer "saves_success"
    t.integer "saves_failures"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.integer "inspiration"
    t.integer "proficiency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "lvl4feat"
    t.string "lvl8feat"
    t.string "lvl12feat"
    t.string "lvl16feat"
    t.string "lvl19feat"
    t.text "description"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "concrete_weapons", force: :cascade do |t|
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "character_id"
    t.bigint "weapon_id"
    t.index ["character_id"], name: "index_concrete_weapons_on_character_id"
    t.index ["weapon_id"], name: "index_concrete_weapons_on_weapon_id"
  end

  create_table "concrete_items", force: :cascade do |t|
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "character_id"
    t.bigint "item_id"
    t.index ["character_id"], name: "index_concrete_items_on_character_id"
    t.index ["item_id"], name: "index_concrete_items_on_item_id"
  end

  create_table "feats", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.string "cost"
    t.string "damage"
    t.string "weight"
    t.string "properties"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characters", "users"
  add_foreign_key "concrete_weapons", "characters"
  add_foreign_key "concrete_weapons", "weapons"
  add_foreign_key "concrete_items", "characters"
  add_foreign_key "concrete_items", "items"
end
