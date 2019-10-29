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

ActiveRecord::Schema.define(version: 20191029120101) do

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "card_number",   null: false
    t.string   "limit_month",   null: false
    t.string   "limit_year",    null: false
    t.string   "security_code", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image_url",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                          null: false
    t.text     "discription",     limit: 65535, null: false
    t.string   "status",                        null: false
    t.integer  "delivery_cost",                 null: false
    t.string   "delivery_method",               null: false
    t.string   "delivery_area",                 null: false
    t.string   "delivery_days",                 null: false
    t.integer  "price",                         null: false
    t.integer  "likes_count",                   null: false
    t.integer  "buyer_id",                      null: false
    t.string   "condition",                     null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "shippings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",   null: false
    t.string   "last_name",    null: false
    t.string   "first_kana",   null: false
    t.string   "last_kana",    null: false
    t.string   "postal_code",  null: false
    t.string   "prefectures",  null: false
    t.string   "city",         null: false
    t.string   "adress",       null: false
    t.string   "building"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "city"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "first_kana"
    t.string   "last_kana"
    t.string   "birthday"
    t.string   "phone_number"
    t.text     "introduction",           limit: 65535
    t.string   "postal_code"
    t.string   "prefectures"
    t.string   "adress"
    t.string   "building"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
