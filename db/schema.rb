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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111219154013) do

  create_table "attachments", :force => true do |t|
    t.integer  "client_application_id"
    t.string   "description"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_applications", :force => true do |t|
    t.string   "business_name"
    t.string   "taxpayer_id_number"
    t.string   "business_address"
    t.string   "business_website"
    t.string   "billing_address"
    t.string   "parent_company"
    t.string   "dba_name"
    t.string   "city"
    t.string   "state_of_residence"
    t.string   "state"
    t.string   "contact_method"
    t.string   "phone_number"
    t.integer  "years_in_business"
    t.integer  "number_of_employees"
    t.string   "zip"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "articles_of_incorporation_file_name"
    t.string   "proof_of_insurance_file_name"
    t.string   "business_license_file_name"
    t.string   "partnership_agreement_file_name"
    t.string   "limited_partnership_file_name"
    t.string   "charter_file_name"
    t.string   "association_resolution_file_name"
    t.string   "irs_tax_exempt_status_form_file_name"
    t.string   "bank_statement_file_name"
    t.string   "tax_return_one_file_name"
    t.string   "tax_return_two_file_name"
    t.string   "business_type"
    t.string   "market_symbol"
    t.string   "other_type"
    t.text     "project_description"
  end

  create_table "principal_information_forms", :force => true do |t|
    t.string   "name"
    t.string   "alternate_name"
    t.string   "ssn"
    t.string   "dob"
    t.string   "dl_number"
    t.string   "dl_state"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "county"
    t.string   "prev_street_address"
    t.string   "prev_city"
    t.string   "prev_state"
    t.string   "prev_zip"
    t.string   "prev_county"
    t.string   "position"
    t.string   "company"
    t.string   "years_with_company"
    t.string   "prev_employer"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
