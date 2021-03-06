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

ActiveRecord::Schema.define(version: 20131202221502) do

  create_table "authors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "authors", ["slug"], name: "index_authors_on_slug"

  create_table "authors_books", id: false, force: true do |t|
    t.integer  "author_id"
    t.string   "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.time     "published_date"
    t.integer  "pages"
    t.integer  "copies"
    t.string   "publishing_house_id"
    t.string   "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_types_id"
    t.string   "slug"
  end

  add_index "books", ["slug"], name: "index_books_on_slug"

  create_table "books_users", id: false, force: true do |t|
    t.string   "book_id"
    t.integer  "User_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug"

  create_table "item_types", force: true do |t|
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", force: true do |t|
    t.integer  "item_type_id"
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "returned_at"
  end

  create_table "magazines", force: true do |t|
    t.string   "title"
    t.string   "volume"
    t.datetime "published_date"
    t.integer  "copies"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_types_id"
    t.integer  "category_id"
    t.string   "slug"
  end

  add_index "magazines", ["slug"], name: "index_magazines_on_slug"

  create_table "magazines_users", id: false, force: true do |t|
    t.integer  "magazine_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishing_houses", force: true do |t|
    t.string   "publishing_house"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "publishing_houses", ["slug"], name: "index_publishing_houses_on_slug"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
