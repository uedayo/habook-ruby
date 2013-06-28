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

ActiveRecord::Schema.define(:version => 20130624090314) do

  create_table "books", :force => true do |t|
    t.string   "isbn"
    t.integer  "volume"
    t.string   "title"
    t.string   "author"
    t.string   "manufacturer"
    t.string   "small_image"
    t.string   "medium_image"
    t.string   "detail_page_url"
    t.integer  "status"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "books", ["isbn", "volume"], :name => "index_books_on_isbn_and_volume", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name",                             :null => false
    t.string   "screen_name",                      :null => false
    t.string   "profile_image_url",                :null => false
    t.integer  "read_count",        :default => 0, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "users", ["screen_name"], :name => "index_users_on_screen_name", :unique => true

end
