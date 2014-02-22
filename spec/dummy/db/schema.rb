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

ActiveRecord::Schema.define(version: 20140222183807) do

  create_table "landing_cat_campaigns", force: true do |t|
    t.string   "utmcsr"
    t.string   "utmcmd"
    t.string   "utmctr"
    t.string   "utmcct"
    t.string   "utmccn"
    t.datetime "created_at"
  end

  add_index "landing_cat_campaigns", ["utmcsr", "utmcmd", "utmctr", "utmcct", "utmccn"], name: "index_landing_cat_campaigns_on_everything", unique: true

  create_table "landing_cat_leads", force: true do |t|
    t.string   "email",       null: false
    t.integer  "campaign_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.string   "message"
  end

  add_index "landing_cat_leads", ["campaign_id"], name: "index_landing_cat_leads_on_campaign_id"
  add_index "landing_cat_leads", ["email"], name: "index_landing_cat_leads_on_email", unique: true
  add_index "landing_cat_leads", ["page_id"], name: "index_landing_cat_leads_on_page_id"

  create_table "landing_cat_pages", force: true do |t|
    t.integer "experiment_id"
    t.integer "weight"
    t.string  "experiment_type", limit: 1
    t.string  "heading"
    t.string  "prompt"
    t.string  "call_to_action"
    t.text    "body"
  end

  add_index "landing_cat_pages", ["experiment_id", "experiment_type"], name: "index_landing_cat_pages_on_experiment_id_and_experiment_type", unique: true

  create_table "split_cat_experiments", force: true do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "winner_id"
    t.datetime "created_at"
  end

  add_index "split_cat_experiments", ["name"], name: "index_split_cat_experiments_on_name", unique: true

  create_table "split_cat_goal_subjects", force: true do |t|
    t.integer  "goal_id"
    t.integer  "subject_id"
    t.integer  "experiment_id"
    t.integer  "hypothesis_id"
    t.datetime "created_at"
  end

  add_index "split_cat_goal_subjects", ["experiment_id"], name: "index_split_cat_goal_subjects_on_experiment_id"
  add_index "split_cat_goal_subjects", ["goal_id", "subject_id"], name: "index_split_cat_gs_on_goal_id_and_subject_id", unique: true

  create_table "split_cat_goals", force: true do |t|
    t.integer  "experiment_id"
    t.string   "name",          null: false
    t.string   "description"
    t.datetime "created_at"
  end

  add_index "split_cat_goals", ["experiment_id", "name"], name: "index_split_cat_goals_on_experiment_id_and_name", unique: true

  create_table "split_cat_hypotheses", force: true do |t|
    t.integer  "experiment_id"
    t.string   "name",          null: false
    t.string   "description"
    t.integer  "weight"
    t.datetime "created_at"
  end

  add_index "split_cat_hypotheses", ["experiment_id", "name"], name: "index_split_cat_hypotheses_on_experiment_id_and_name", unique: true

  create_table "split_cat_hypothesis_subjects", force: true do |t|
    t.integer  "hypothesis_id"
    t.integer  "subject_id"
    t.integer  "experiment_id"
    t.datetime "created_at"
  end

  add_index "split_cat_hypothesis_subjects", ["experiment_id", "subject_id"], name: "index_split_cat_hs_on_experiment_id_and_subject_id", unique: true

  create_table "split_cat_subjects", force: true do |t|
    t.string   "token"
    t.datetime "created_at"
  end

  add_index "split_cat_subjects", ["token"], name: "index_split_cat_subjects_on_token", unique: true

end
