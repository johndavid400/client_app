class AddDetailsToApplications < ActiveRecord::Migration
  def self.up
    add_column :applications, :city, :string
    add_column :applications, :state, :string
    add_column :applications, :contact_method, :string
    add_column :applications, :phone_number, :string
    add_column :applications, :years_in_business, :integer
    add_column :applications, :number_of_employees, :integer
  end
  def self.down
    remove_column :applications, :number_of_employees
    remove_column :applications, :years_in_business
    remove_column :applications, :phone_number
    remove_column :applications, :contact_method
    remove_column :applications, :state
    remove_column :applications, :city
  end
end
