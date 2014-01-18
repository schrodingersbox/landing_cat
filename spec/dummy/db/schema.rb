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

ActiveRecord::Schema.define(version: 20140118015913) do

  create_table "landing_cat_campaigns", force: true do |t|
    t.string   "utmcsr"
    t.string   "utmcmd"
    t.string   "utmctr"
    t.string   "utmcct"
    t.string   "utmccn"
    t.string   "utmgclid"
    t.datetime "created_at"
  end

  add_index "landing_cat_campaigns", ["utmcsr", "utmcmd", "utmctr", "utmcct", "utmccn", "utmgclid"], name: "index_landing_cat_campaigns_on_everything", unique: true

  create_table "landing_cat_leads", force: true do |t|
    t.string   "email",       null: false
    t.integer  "campaign_id"
    t.integer  "page_id"
    t.datetime "created_at"
  end

  add_index "landing_cat_leads", ["campaign_id"], name: "index_landing_cat_leads_on_campaign_id"
  add_index "landing_cat_leads", ["email"], name: "index_landing_cat_leads_on_email", unique: true
  add_index "landing_cat_leads", ["page_id"], name: "index_landing_cat_leads_on_page_id"

  create_table "landing_cat_pages", force: true do |t|
    t.string "name",                       null: false
    t.string "experiment_id",   limit: 64
    t.string "experiment_key",  limit: 64
    t.string "experiment_type", limit: 1
    t.string "heading"
    t.string "prompt"
    t.string "call_to_action"
    t.text   "body"
  end

  add_index "landing_cat_pages", ["name"], name: "index_landing_cat_pages_on_name", unique: true

end
