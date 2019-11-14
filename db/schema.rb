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

=======
ActiveRecord::Schema.define(version: 2019_11_14_202406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


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
  end

end
