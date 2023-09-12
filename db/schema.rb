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

ActiveRecord::Schema.define(version: 2023_09_12_230232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_logs", force: :cascade do |t|
    t.string "text"
    t.bigint "performer_id", null: false
    t.bigint "session_id"
    t.bigint "adventure_id", null: false
    t.jsonb "extra", default: {}
    t.string "activity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adventure_id"], name: "index_activity_logs_on_adventure_id"
    t.index ["performer_id"], name: "index_activity_logs_on_performer_id"
    t.index ["session_id"], name: "index_activity_logs_on_session_id"
  end

  create_table "adventure_sessions", force: :cascade do |t|
    t.date "date"
    t.string "title"
    t.string "description"
    t.bigint "adventure_id", null: false
    t.datetime "finished_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adventure_id"], name: "index_adventure_sessions_on_adventure_id"
  end

  create_table "adventures", force: :cascade do |t|
    t.string "name"
    t.bigint "gamemaster_id", null: false
    t.jsonb "data", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gamemaster_id"], name: "index_adventures_on_gamemaster_id"
  end

  create_table "backgrounds", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "source"
    t.jsonb "proficiencies", default: {}
    t.jsonb "features", default: {}
    t.jsonb "initial_equipment", default: {}
    t.bigint "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_backgrounds_on_creator_id"
  end

  create_table "game_classes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "abilities_hint"
    t.string "source"
    t.string "hit_dice"
    t.jsonb "proficiencies", default: {}
    t.jsonb "multiclassing", default: {}
    t.jsonb "initial_equipment", default: {}
    t.jsonb "spellcasting"
    t.jsonb "features", default: {}
    t.bigint "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "subclasses", default: {}
    t.index ["creator_id"], name: "index_game_classes_on_creator_id"
  end

  create_table "hero_game_classes", force: :cascade do |t|
    t.bigint "hero_id", null: false
    t.bigint "game_class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_class_id"], name: "index_hero_game_classes_on_game_class_id"
    t.index ["hero_id"], name: "index_hero_game_classes_on_hero_id"
  end

  create_table "hero_talents", force: :cascade do |t|
    t.bigint "hero_id", null: false
    t.bigint "talent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hero_id"], name: "index_hero_talents_on_hero_id"
    t.index ["talent_id"], name: "index_hero_talents_on_talent_id"
  end

  create_table "heroes", force: :cascade do |t|
    t.string "name"
    t.jsonb "body_traits", default: {}
    t.jsonb "personality_traits", default: {}
    t.bigint "adventure_id"
    t.bigint "player_id", null: false
    t.bigint "race_id"
    t.bigint "background_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adventure_id"], name: "index_heroes_on_adventure_id"
    t.index ["background_id"], name: "index_heroes_on_background_id"
    t.index ["player_id"], name: "index_heroes_on_player_id"
    t.index ["race_id"], name: "index_heroes_on_race_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "validation_token"
    t.datetime "validation_token_expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "last_login_at"
    t.integer "login_count", default: 0
  end

  create_table "races", force: :cascade do |t|
    t.string "title"
    t.string "source"
    t.bigint "creator_id"
    t.boolean "only_subraces", default: false
    t.string "normal_size"
    t.jsonb "features", default: {}
    t.jsonb "caracteristics", default: {}
    t.jsonb "abilities", default: {}
    t.jsonb "speeds", default: {}
    t.jsonb "languages", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_races_on_creator_id"
  end

  create_table "talents", force: :cascade do |t|
    t.string "title"
    t.jsonb "prerequisites"
    t.jsonb "features"
    t.bigint "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_talents_on_creator_id"
  end

  add_foreign_key "activity_logs", "adventure_sessions", column: "session_id"
  add_foreign_key "activity_logs", "adventures"
  add_foreign_key "activity_logs", "players", column: "performer_id"
  add_foreign_key "adventure_sessions", "adventures"
  add_foreign_key "adventures", "players", column: "gamemaster_id"
  add_foreign_key "backgrounds", "players", column: "creator_id"
  add_foreign_key "game_classes", "players", column: "creator_id"
  add_foreign_key "hero_game_classes", "game_classes"
  add_foreign_key "hero_game_classes", "heroes"
  add_foreign_key "hero_talents", "heroes"
  add_foreign_key "hero_talents", "talents"
  add_foreign_key "heroes", "adventures"
  add_foreign_key "heroes", "backgrounds"
  add_foreign_key "heroes", "players"
  add_foreign_key "heroes", "races"
  add_foreign_key "races", "players", column: "creator_id"
  add_foreign_key "talents", "players", column: "creator_id"
end
