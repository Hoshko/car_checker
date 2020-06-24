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

ActiveRecord::Schema.define(version: 2019_05_27_095743) do

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.integer "review_id"
    t.boolean "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["review_id"], name: "index_answers_on_review_id"
  end

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.string "manufacturer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.integer "car_model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_model_id"], name: "index_questions_on_car_model_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "car_model_id"
    t.decimal "requested_price"
    t.decimal "suggested_price"
    t.string "comment"
    t.string "owner_name"
    t.string "owner_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_model_id"], name: "index_reviews_on_car_model_id"
  end

end
