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

ActiveRecord::Schema.define(version: 20150828023114) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "creator_id", limit: 4
    t.integer  "kind",       limit: 4
    t.integer  "issue_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["creator_id"], name: "index_activities_on_creator_id", using: :btree
    t.index ["issue_id"], name: "index_activities_on_issue_id", using: :btree
  end

  create_table "activity_contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text    "original",    limit: 65535
    t.text    "transformed", limit: 65535
    t.integer "activity_id", limit: 4
    t.index ["activity_id"], name: "index_activity_contents_on_activity_id", using: :btree
  end

  create_table "attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "attachable_type",   limit: 255
    t.integer  "attachable_id",     limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.index ["attachable_id", "attachable_type"], name: "index_attachments_on_attachable_id_and_attachable_type", using: :btree
  end

  create_table "issues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "subject",           limit: 255
    t.integer  "project_id",        limit: 4
    t.integer  "assignee_id",       limit: 4
    t.integer  "creator_id",        limit: 4
    t.datetime "due_date"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "tracker_id",        limit: 4
    t.integer  "priority_id",       limit: 4
    t.integer  "target_version_id", limit: 4
    t.text     "description",       limit: 65535
    t.index ["creator_id"], name: "index_issues_on_creator_id", using: :btree
    t.index ["priority_id"], name: "index_issues_on_priority_id", using: :btree
    t.index ["project_id"], name: "index_issues_on_project_id", using: :btree
    t.index ["target_version_id"], name: "index_issues_on_target_version_id", using: :btree
    t.index ["tracker_id"], name: "index_issues_on_tracker_id", using: :btree
  end

  create_table "priorities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "project_id", limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["project_id", "name"], name: "index_priorities_on_project_id_and_name", unique: true, using: :btree
    t.index ["project_id"], name: "index_priorities_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "projects_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "project_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["project_id", "user_id"], name: "index_projects_users_on_project_id_and_user_id", unique: true, using: :btree
    t.index ["project_id"], name: "index_projects_users_on_project_id", using: :btree
    t.index ["user_id"], name: "index_projects_users_on_user_id", using: :btree
  end

  create_table "target_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 255
    t.integer  "project_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["project_id", "name"], name: "index_target_versions_on_project_id_and_name", unique: true, using: :btree
    t.index ["project_id"], name: "index_target_versions_on_project_id", using: :btree
  end

  create_table "trackers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 255
    t.integer  "project_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["project_id", "name"], name: "index_trackers_on_project_id_and_name", unique: true, using: :btree
    t.index ["project_id"], name: "index_trackers_on_project_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",           limit: 255, default: "", null: false
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255,              null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "access_token",    limit: 255
    t.index ["access_token"], name: "index_users_on_access_token", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
