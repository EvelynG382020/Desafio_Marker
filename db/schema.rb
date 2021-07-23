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

ActiveRecord::Schema.define(version: 2021_07_23_065730) do

  create_table "categories", force: :cascade do |t|
    t.integer "category_id"
    t.integer "type_id"
    t.string "name"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
    t.index ["type_id"], name: "index_categories_on_type_id"
  end

  create_table "categories_markers", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "marker_id", null: false
    t.index ["category_id", "marker_id"], name: "index_categories_markers_on_category_id_and_marker_id"
    t.index ["marker_id", "category_id"], name: "index_categories_markers_on_marker_id_and_category_id"
  end

  create_table "markers", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_markers_on_category_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
