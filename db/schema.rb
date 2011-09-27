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

ActiveRecord::Schema.define(:version => 20110530224421) do

	create_table "admins", :force => true do |t|
		t.string   "username",        :default => "", :null => false
		t.string   "hashed_password", :default => "", :null => false
		t.datetime "created_at"
		t.datetime "updated_at"
		t.string   "salt",            :default => "", :null => false
	end

	create_table "seeds", :force => true do |t|
		t.string   "title",                  :default => ""
		t.column   "description", :text
		t.column   "thumbnail",   :text
		t.column   "content",     :text,          				:null => false
		t.string   "mediatype",        	          				:null => false
		t.integer  "ranking"
		t.string   "category",									:null => false
		t.integer  "feeds",       :default => 0
		t.integer  "views",       :default => 0
		t.datetime "created_at"
		t.datetime "updated_at"
	end
end
