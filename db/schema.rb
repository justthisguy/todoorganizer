# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_21_210327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "notes"
    t.string "timeframe"
    t.datetime "deadline"
    t.string "tags"
    t.string "checklist_items"
    t.string "list_id"
    t.string "list"
    t.string "heading"
    t.boolean "completed"
    t.boolean "canceled"
    t.datetime "creation_date"
    t.string "completion_date"
    t.string "datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wunderfolders", force: :cascade do |t|
    t.string "title"
    t.string "directory_path"
    t.datetime "createdAt"
    t.datetime "updatedAt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wunderlists", force: :cascade do |t|
    t.bigint "wunderfolder_id", null: false
    t.bigint "original_id"
    t.string "title"
    t.string "directory_path"
    t.string "text_file_path"
    t.string "html_file_path"
    t.datetime "createdAt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wunderfolder_id"], name: "index_wunderlists_on_wunderfolder_id"
  end

  create_table "wundersubtasks", force: :cascade do |t|
    t.bigint "wundertask_id", null: false
    t.string "title"
    t.boolean "completed"
    t.datetime "completedAt"
    t.datetime "createdAt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wundertask_id"], name: "index_wundersubtasks_on_wundertask_id"
  end

  create_table "wundertasks", force: :cascade do |t|
    t.bigint "wunderlist_id", null: false
    t.bigint "original_id"
    t.string "title"
    t.boolean "completed"
    t.boolean "starred"
    t.jsonb "notes", default: []
    t.datetime "createdAt"
    t.datetime "completedAt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wunderlist_id"], name: "index_wundertasks_on_wunderlist_id"
  end

  create_table "zenkitfolders", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "zenkitlists", force: :cascade do |t|
    t.bigint "zenkitfolder_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["zenkitfolder_id"], name: "index_zenkitlists_on_zenkitfolder_id"
  end

  create_table "zenkitsubtasks", force: :cascade do |t|
    t.bigint "zenkittask_id", null: false
    t.string "title"
    t.boolean "done"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["zenkittask_id"], name: "index_zenkitsubtasks_on_zenkittask_id"
  end

  create_table "zenkittasks", force: :cascade do |t|
    t.bigint "zenkitlist_id", null: false
    t.string "title"
    t.string "stage"
    t.string "due_date"
    t.string "notes"
    t.string "files"
    t.string "assigned_to"
    t.datetime "created"
    t.datetime "last_updated"
    t.string "created_by"
    t.string "last_updated_by"
    t.string "checklists"
    t.string "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["zenkitlist_id"], name: "index_zenkittasks_on_zenkitlist_id"
  end

  add_foreign_key "wunderlists", "wunderfolders"
  add_foreign_key "wundersubtasks", "wundertasks"
  add_foreign_key "wundertasks", "wunderlists"
  add_foreign_key "zenkitlists", "zenkitfolders"
  add_foreign_key "zenkitsubtasks", "zenkittasks"
  add_foreign_key "zenkittasks", "zenkitlists"
end
