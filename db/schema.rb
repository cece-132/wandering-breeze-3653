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

ActiveRecord::Schema.define(version: 2022_08_29_230147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "theme"
    t.integer "project_budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contestant_projects", force: :cascade do |t|
    t.bigint "contestant_id"
    t.bigint "project_id"
    t.index ["contestant_id"], name: "index_contestant_projects_on_contestant_id"
    t.index ["project_id"], name: "index_contestant_projects_on_project_id"
  end

  create_table "contestants", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "hometown"
    t.integer "years_of_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gardens", force: :cascade do |t|
    t.string "name"
    t.boolean "organic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "days_to_harvest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plot_plants", force: :cascade do |t|
    t.bigint "plant_id"
    t.bigint "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_plot_plants_on_plant_id"
    t.index ["plot_id"], name: "index_plot_plants_on_plot_id"
  end

  create_table "plots", force: :cascade do |t|
    t.integer "number"
    t.string "size"
    t.string "direction"
    t.bigint "garden_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_plots_on_garden_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "material"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "challenge_id"
    t.index ["challenge_id"], name: "index_projects_on_challenge_id"
  end

  add_foreign_key "contestant_projects", "contestants"
  add_foreign_key "contestant_projects", "projects"
  add_foreign_key "plot_plants", "plants"
  add_foreign_key "plot_plants", "plots"
  add_foreign_key "plots", "gardens"
  add_foreign_key "projects", "challenges"
end
