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

ActiveRecord::Schema.define(version: 20150722191636) do

  create_table "articles", force: true do |t|
    t.string   "authors"
    t.string   "title"
    t.date     "issue_date"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.integer  "section_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "contents", force: true do |t|
    t.integer  "article_id"
    t.text     "doc",        limit: 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["article_id"], name: "index_contents_on_article_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name",       null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer  "parent_id"
    t.string   "name",                                                      null: false
    t.string   "title",                                                     null: false
    t.string   "menu_title",                                                null: false
    t.string   "url",                                                       null: false
    t.text     "content_top"
    t.text     "content_bottom"
    t.string   "seo_title",                                                 null: false
    t.string   "seo_keys"
    t.text     "seo_description"
    t.integer  "position",                                                  null: false
    t.integer  "status",                          limit: 1, default: 0,     null: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.text     "strip_center_text"
    t.boolean  "ability_to_create_comment",                 default: false
    t.boolean  "ability_to_read_comments",                  default: false
    t.boolean  "ability_to_read_service_options",           default: false
    t.boolean  "ability_to_read_rooms",                     default: false
    t.integer  "search_id"
    t.boolean  "use_custom_page",                           default: false
    t.string   "custom_page"
    t.integer  "picture_id"
    t.text     "description"
    t.string   "front_cover"
    t.integer  "service_id"
    t.boolean  "ability_to_read_services",                  default: false
    t.boolean  "show_link_in_top_menu",                     default: false
    t.integer  "content_top_version",                       default: 0
    t.boolean  "button_for_call_request",                   default: false
    t.boolean  "on_home_page",                              default: false
  end

  add_index "pages", ["name"], name: "index_pages_on_name", unique: true, using: :btree
  add_index "pages", ["parent_id"], name: "index_pages_on_parent_id", using: :btree
  add_index "pages", ["picture_id"], name: "index_pages_on_picture_id", using: :btree
  add_index "pages", ["search_id"], name: "index_pages_on_search_id", using: :btree
  add_index "pages", ["seo_title"], name: "index_pages_on_seo_title", unique: true, using: :btree
  add_index "pages", ["service_id"], name: "index_pages_on_service_id", using: :btree

  create_table "pages_services", force: true do |t|
    t.integer "page_id"
    t.integer "service_id"
  end

  add_index "pages_services", ["page_id"], name: "index_pages_services_on_page_id", using: :btree
  add_index "pages_services", ["service_id"], name: "index_pages_services_on_service_id", using: :btree

  create_table "pictures", force: true do |t|
    t.string   "filename",   null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.string   "sku"
    t.decimal  "price",       precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["sku"], name: "index_products_on_sku", unique: true, using: :btree

  create_table "sections", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
