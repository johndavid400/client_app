class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.string :business_name
      t.string :taxpayer_id_number
      t.string :business_address
      t.string :business_website
      t.string :billing_address
      t.string :parent_company
      t.string :dba_name

      t.timestamps
    end
  end
end
