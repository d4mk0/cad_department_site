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

ActiveRecord::Schema.define(version: 20150510084909) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "ads", force: :cascade do |t|
    t.string   "title",      limit: 255,                  null: false
    t.text     "text",       limit: 65535,                null: false
    t.boolean  "published",  limit: 1,     default: true, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "disciplines", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.text     "description", limit: 65535, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "docs", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "user_id",    limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "docs", ["user_id"], name: "index_docs_on_user_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "full_name",       limit: 255,                   null: false
    t.string   "photo",           limit: 255
    t.string   "post",            limit: 255,                   null: false
    t.string   "academic_degree", limit: 255
    t.string   "academic_title",  limit: 255
    t.text     "description",     limit: 65535,                 null: false
    t.boolean  "published",       limit: 1,     default: false, null: false
    t.integer  "position",        limit: 4
    t.string   "contact_details", limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",             limit: 255,                   null: false
    t.text     "short_description", limit: 65535,                 null: false
    t.text     "text",              limit: 65535,                 null: false
    t.boolean  "published",         limit: 1,     default: false, null: false
    t.integer  "views",             limit: 4,     default: 0,     null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 255,                   null: false
    t.text     "text",       limit: 65535,                 null: false
    t.string   "permalink",  limit: 255,                   null: false
    t.boolean  "published",  limit: 1,     default: false, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "pages", ["permalink"], name: "index_pages_on_permalink", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255,                 null: false
    t.string   "last_name",              limit: 255,                 null: false
    t.string   "patronymic",             limit: 255,                 null: false
    t.boolean  "admin",                  limit: 1,   default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.integer  "doc_id",     limit: 4,   null: false
    t.string   "path",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "versions", ["doc_id"], name: "index_versions_on_doc_id", using: :btree

  add_foreign_key "versions", "docs"
end
