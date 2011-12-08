class AddEmailAndZipToApplications < ActiveRecord::Migration
  def self.up
    add_column :applications, :zip, :string
    add_column :applications, :email, :string
  end
  def self.down
    remove_column :applications, :email
    remove_column :applications, :zip
  end
end
