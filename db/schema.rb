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

ActiveRecord::Schema.define(version: 20181020171802) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "ads", force: :cascade do |t|
    t.string   "title",                limit: 80
    t.text     "description"
    t.integer  "category_id"
    t.integer  "member_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "price_cents",                     default: 0
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size",    limit: 8
    t.datetime "picture_updated_at"
    t.date     "finish_date"
    t.text     "description_md"
    t.text     "description_short"
  end

  add_index "ads", ["category_id"], name: "index_ads_on_category_id"
  add_index "ads", ["member_id"], name: "index_ads_on_member_id"

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "description", limit: 50
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "ads_count",              default: 0
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true

  create_table "classifications", force: :cascade do |t|
    t.string   "rating_system", limit: 3
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "member_id"
    t.integer  "ad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["ad_id"], name: "index_comments_on_ad_id"
  add_index "comments", ["member_id"], name: "index_comments_on_member_id"

  create_table "exchanges", force: :cascade do |t|
    t.integer  "price_cents",    default: 0
    t.integer  "member_id"
    t.integer  "member_game_id"
    t.integer  "game_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "exchanges", ["game_id"], name: "index_exchanges_on_game_id"
  add_index "exchanges", ["member_game_id"], name: "index_exchanges_on_member_game_id"
  add_index "exchanges", ["member_id"], name: "index_exchanges_on_member_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "games", force: :cascade do |t|
    t.string   "name",                 limit: 50
    t.text     "description",          limit: 500
    t.integer  "genre_id"
    t.integer  "classification_id"
    t.integer  "platform_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size",    limit: 8
    t.datetime "picture_updated_at"
  end

  add_index "games", ["classification_id"], name: "index_games_on_classification_id"
  add_index "games", ["genre_id"], name: "index_games_on_genre_id"
  add_index "games", ["platform_id"], name: "index_games_on_platform_id"

  create_table "games_genres", id: false, force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "game_id",  null: false
  end

  create_table "games_platforms", id: false, force: :cascade do |t|
    t.integer "platform_id", null: false
    t.integer "game_id",     null: false
  end

  add_index "games_platforms", ["game_id", "platform_id"], name: "index_games_platforms_on_game_id_and_platform_id"
  add_index "games_platforms", ["platform_id", "game_id"], name: "index_games_platforms_on_platform_id_and_game_id"

  create_table "genres", force: :cascade do |t|
    t.string   "description", limit: 25
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "member_games", force: :cascade do |t|
    t.text     "quality",    limit: 200
    t.string   "platform",   limit: 50
    t.integer  "game_id"
    t.integer  "member_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "member_games", ["game_id"], name: "index_member_games_on_game_id"
  add_index "member_games", ["member_id"], name: "index_member_games_on_member_id"

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "profile_members", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.date     "birthdate"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profile_members", ["member_id"], name: "index_profile_members_on_member_id"

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id"

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "sales", force: :cascade do |t|
    t.integer  "price_cents",    default: 0
    t.integer  "member_id"
    t.integer  "member_game_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "sales", ["member_game_id"], name: "index_sales_on_member_game_id"
  add_index "sales", ["member_id"], name: "index_sales_on_member_id"

end
