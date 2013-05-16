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

ActiveRecord::Schema.define(:version => 20130516214554) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "cause_applications", :force => true do |t|
    t.string "name"
    t.string "org_name"
    t.string "website"
    t.string "email"
    t.string "phone_number"
    t.text   "mission"
    t.text   "how_hear"
  end

  create_table "cause_causeneeds", :force => true do |t|
    t.integer "cause_id"
    t.integer "causeneed_id"
  end

  create_table "cause_types", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "causes", :force => true do |t|
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "name"
    t.text     "description"
    t.text     "mission_statement"
    t.text     "how_hear"
    t.string   "phone_number"
    t.string   "email"
    t.string   "website"
    t.integer  "cause_type_id"
    t.string   "city"
    t.string   "state"
    t.string   "video_link"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "is_featured",          :default => false
    t.string   "twitter_handle"
    t.string   "facebook_url"
  end

  create_table "causes_causeneeds", :id => false, :force => true do |t|
    t.integer "cause_id"
    t.integer "cause_need_id"
  end

  create_table "donations", :force => true do |t|
    t.float    "amount"
    t.float    "tip"
    t.string   "tracking"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "donations_need_id"
  end

  create_table "donations_needs", :force => true do |t|
    t.integer "cause_id"
    t.text    "description"
    t.string  "name"
  end

  create_table "good_needs", :force => true do |t|
    t.integer  "cause_id"
    t.string   "name"
    t.text     "description"
    t.text     "address"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "locations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "cause_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
  end

  create_table "locations_causes", :id => false, :force => true do |t|
    t.integer "location_id"
    t.integer "cause_id"
  end

  create_table "permissions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "social_needs", :force => true do |t|
    t.integer "cause_id"
    t.text    "description"
    t.string  "name"
  end

  create_table "subscribes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
  end

  create_table "usercauses", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "cause_id"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "bio"
    t.string   "city"
    t.string   "state"
    t.integer  "level",                  :default => 0
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "volunteer_needs", :force => true do |t|
    t.integer  "cause_id"
    t.text     "description"
    t.string   "name"
    t.string   "address"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "volunteers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.integer  "volunteer_need_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "email"
  end

end
