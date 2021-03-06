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

ActiveRecord::Schema.define(:version => 20120319034515) do

  create_table "album_pictures", :force => true do |t|
    t.string    "title"
    t.integer   "album_id"
    t.string    "image_file_name"
    t.string    "image_content_type"
    t.integer   "image_file_size"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "album_pictures", ["album_id"], :name => "index_album_pictures_on_album_id"

  create_table "albums", :force => true do |t|
    t.string    "title"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.integer  "created_by_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "front_page"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "shared"
  end

  add_index "articles", ["shared"], :name => "index_articles_on_shared"

  create_table "contact_request_emails", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "contact_requests", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.string    "subject"
    t.text      "message"
    t.boolean   "received",   :default => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "details"
    t.string   "location"
    t.datetime "start"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "shared"
    t.datetime "shared_before"
  end

  add_index "events", ["shared"], :name => "index_events_on_shared"

  create_table "forcasts", :force => true do |t|
    t.text      "raw_xml"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.text      "winnipeg"
  end

  create_table "newsletters", :force => true do |t|
    t.string   "name"
    t.string   "newsletter_file_name"
    t.string   "newsletter_content_type"
    t.integer  "newsletter_file_size"
    t.datetime "newsletter_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "shared"
  end

  add_index "newsletters", ["shared"], :name => "index_newsletters_on_shared"

  create_table "sponsors", :force => true do |t|
    t.string    "name"
    t.string    "phone_number"
    t.string    "address"
    t.string    "city"
    t.string    "url"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "sponsors", ["name"], :name => "index_sponsors_on_name"

  create_table "trail_conditions", :force => true do |t|
    t.string   "trail_name"
    t.string   "status"
    t.text     "details"
    t.integer  "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "shared"
    t.datetime "user_updated_at"
  end

  create_table "twitter_feeds", :force => true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                 :default => "", :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
