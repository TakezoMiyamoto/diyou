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

ActiveRecord::Schema.define(version: 20160829122457) do

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

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.integer  "recipe_id",     limit: 4
    t.string   "material_name", limit: 255
    t.string   "qty",           limit: 255
    t.string   "ing_image",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "recipe_name", limit: 255
    t.string   "category",    limit: 255
    t.string   "main_image",  limit: 255
    t.string   "level",       limit: 255
    t.integer  "time",        limit: 4
    t.integer  "cost",        limit: 4
    t.string   "youtube_url", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "recipes", ["user_id", "created_at"], name: "index_recipes_on_user_id_and_created_at", using: :btree
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "favoriter_id", limit: 4
    t.integer  "favorited_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "relationships", ["favorited_id"], name: "index_relationships_on_favorited_id", using: :btree
  add_index "relationships", ["favoriter_id", "favorited_id"], name: "index_relationships_on_favoriter_id_and_favorited_id", unique: true, using: :btree
  add_index "relationships", ["favoriter_id"], name: "index_relationships_on_favoriter_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.integer  "recipe_id",   limit: 4
    t.string   "step_image",  limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "steps", ["recipe_id"], name: "index_steps_on_recipe_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "username",               limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "remote_avatar",          limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "ingredients", "recipes"
  add_foreign_key "recipes", "users"
  add_foreign_key "steps", "recipes"
end
