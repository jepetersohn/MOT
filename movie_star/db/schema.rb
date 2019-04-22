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

ActiveRecord::Schema.define(version: 20170105163503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "genre",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title",                                                                                         null: false
    t.integer  "year"
    t.string   "actors"
    t.string   "runtime"
    t.string   "plot"
    t.integer  "category_id"
    t.datetime "created_at",                                                                                    null: false
    t.datetime "updated_at",                                                                                    null: false
    t.string   "url"
    t.string   "img",         default: "http://hdimagesnew.com/wp-content/uploads/2016/09/image-not-found.jpg"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "score",      null: false
    t.integer  "rater_id",   null: false
    t.integer  "review_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "body",        null: false
    t.integer  "reviewer_id", null: false
    t.integer  "movie_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                         null: false
    t.string   "email",                            null: false
    t.string   "hashed_password",                  null: false
    t.boolean  "trusted_reviewer", default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
