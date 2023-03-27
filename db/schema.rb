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

ActiveRecord::Schema[7.0].define(version: 2023_03_27_125102) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cheese_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cheese_id"], name: "index_bookmarks_on_cheese_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "cheeses", force: :cascade do |t|
    t.string "name"
    t.string "affinage"
    t.string "lait"
    t.string "pate"
    t.string "saison"
    t.string "category"
    t.string "picture_url"
    t.text "description_1"
    t.text "description_2"
    t.boolean "filter_pregnant"
    t.boolean "filter_vache"
    t.boolean "filter_chevre"
    t.boolean "filter_brebis"
    t.boolean "filter_AOP"
    t.string "wine"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forbiddens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cheese_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cheese_id"], name: "index_forbiddens_on_cheese_id"
    t.index ["user_id"], name: "index_forbiddens_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.text "content"
    t.string "name"
    t.string "picture_url"
    t.string "link_to_source"
    t.bigint "cheese_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cheese_id"], name: "index_recipes_on_cheese_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "cheese_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cheese_id"], name: "index_reviews_on_cheese_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pseudo"
    t.integer "score_search_vache", default: 10, null: false
    t.integer "score_search_chevre", default: 10, null: false
    t.integer "score_search_brebis", default: 10, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "cheeses"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "forbiddens", "cheeses"
  add_foreign_key "forbiddens", "users"
  add_foreign_key "recipes", "cheeses"
  add_foreign_key "reviews", "cheeses"
  add_foreign_key "reviews", "users"
end
