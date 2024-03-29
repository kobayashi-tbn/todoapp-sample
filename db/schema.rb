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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121208065624) do

  create_table "roles", :id => false, :force => true do |t|
    t.integer  "role_id",    :null => false
    t.string   "name",       :null => false
    t.string   "notice"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "todos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "limit_on"
    t.boolean  "done"
    t.string   "username"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "created_by"
    t.string   "updated_by"
  end

  create_table "users", :id => false, :force => true do |t|
    t.string   "username",               :limit => 20,                 :null => false
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :force => true do |t|
    t.string   "username",   :null => false
    t.integer  "role_id",    :null => false
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users_roles", ["username", "role_id"], :name => "index_users_roles_on_username_and_role_id", :unique => true

end
