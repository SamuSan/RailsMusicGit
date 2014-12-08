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

ActiveRecord::Schema.define(version: 20141130205354) do

  create_table "commits", force: true do |t|
    t.integer  "project_id",       null: false
    t.integer  "parent_commit_id"
    t.integer  "commit_number",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commits", ["parent_commit_id"], name: "index_commits_on_parent_commit_id"
  add_index "commits", ["project_id"], name: "index_commits_on_project_id"

  create_table "notes", force: true do |t|
    t.integer  "position",                   null: false
    t.integer  "duration",   default: 4,     null: false
    t.float    "frequency",  default: 261.6, null: false
    t.integer  "commit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["commit_id"], name: "index_notes_on_commit_id"

  create_table "projects", force: true do |t|
    t.string   "title",      default: "Untitled", null: false
    t.integer  "tempo",      default: 120,        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
