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

ActiveRecord::Schema.define(version: 20170722133907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "challenge_rating_criteria", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.uuid     "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["challenge_id"], name: "index_challenge_rating_criteria_on_challenge_id", using: :btree
  end

  create_table "challenges", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "title"
    t.text     "subject"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.uuid     "language_set_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["language_set_id"], name: "index_challenges_on_language_set_id", using: :btree
  end

  create_table "contacts", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "desk_user_memberships", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "desk_id"
    t.uuid     "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["desk_id"], name: "index_desk_user_memberships_on_desk_id", using: :btree
    t.index ["user_id"], name: "index_desk_user_memberships_on_user_id", using: :btree
  end

  create_table "desks", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financial_movements", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.float    "amount"
    t.text     "description"
    t.uuid     "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_financial_movements_on_user_id", using: :btree
  end

  create_table "jury_challenge_membership_invitations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "challenge_id"
    t.string   "user_email"
    t.integer  "status",       default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["challenge_id"], name: "index_jury_challenge_membership_invitations_on_challenge_id", using: :btree
  end

  create_table "jury_challenge_membership_requests", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "challenge_id"
    t.uuid     "user_id"
    t.integer  "status",       default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["challenge_id"], name: "index_jury_challenge_membership_requests_on_challenge_id", using: :btree
    t.index ["user_id"], name: "index_jury_challenge_membership_requests_on_user_id", using: :btree
  end

  create_table "jury_challenge_memberships", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["challenge_id"], name: "index_jury_challenge_memberships_on_challenge_id", using: :btree
    t.index ["user_id"], name: "index_jury_challenge_memberships_on_user_id", using: :btree
  end

  create_table "jury_challenge_rates", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer  "rating"
    t.text     "informations"
    t.uuid     "jury_challenge_membership_id"
    t.uuid     "challenge_rating_criterium_id"
    t.uuid     "team_challenge_membership_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["challenge_rating_criterium_id"], name: "index_jury_challenge_rates_on_challenge_rating_criterium_id", using: :btree
    t.index ["jury_challenge_membership_id"], name: "index_jury_challenge_rates_on_jury_challenge_membership_id", using: :btree
    t.index ["team_challenge_membership_id"], name: "index_jury_challenge_rates_on_team_challenge_membership_id", using: :btree
  end

  create_table "language_set_memberships", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "language_id"
    t.uuid     "language_set_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["language_id"], name: "index_language_set_memberships_on_language_id", using: :btree
    t.index ["language_set_id"], name: "index_language_set_memberships_on_language_set_id", using: :btree
  end

  create_table "language_sets", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "documentation_url"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "subscriptions", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "financial_movement_id"
    t.uuid     "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["financial_movement_id"], name: "index_subscriptions_on_financial_movement_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "team_challenge_memberships", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "team_id"
    t.uuid     "challenge_id"
    t.string   "github_repository"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["challenge_id"], name: "index_team_challenge_memberships_on_challenge_id", using: :btree
    t.index ["team_id"], name: "index_team_challenge_memberships_on_team_id", using: :btree
  end

  create_table "team_user_membership_invitations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "team_id"
    t.string   "user_email"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["team_id"], name: "index_team_user_membership_invitations_on_team_id", using: :btree
  end

  create_table "team_user_membership_requests", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "team_id"
    t.uuid     "user_id"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["team_id"], name: "index_team_user_membership_requests_on_team_id", using: :btree
    t.index ["user_id"], name: "index_team_user_membership_requests_on_user_id", using: :btree
  end

  create_table "team_user_memberships", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "team_id"
    t.uuid     "user_id"
    t.integer  "role"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_user_memberships_on_team_id", using: :btree
    t.index ["user_id"], name: "index_team_user_memberships_on_user_id", using: :btree
  end

  create_table "teams", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "username"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "locale",                 default: "fr", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "facebook_id"
    t.string   "facebook_name"
    t.string   "facebook_image"
    t.string   "github_id"
    t.string   "github_name"
    t.string   "github_username"
    t.string   "github_image"
    t.string   "google_oauth2_id"
    t.string   "google_oauth2_name"
    t.string   "google_oauth2_image"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
