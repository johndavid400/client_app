class CreateClientApplications < ActiveRecord::Migration
  def self.up
    create_table :client_applications do |t|
      t.string :business_name
      t.string :taxpayer_id_number
      t.string :business_address
      t.string :business_website
      t.string :billing_address
      t.string :parent_company
      t.string :dba_name
      t.string :city
      t.string :application_state
      t.string :state_id
      t.boolean :contact_by_email
      t.string :phone_number
      t.integer :years_in_business
      t.integer :number_of_employees
      t.string :zip
      t.string :email
      t.integer :user_id
      t.integer :progress

      t.timestamps
    end
  end
  def self.down
    drop_table :client_applications
  end
end
