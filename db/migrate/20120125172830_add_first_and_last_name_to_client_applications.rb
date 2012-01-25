class AddFirstAndLastNameToClientApplications < ActiveRecord::Migration
  def change
    add_column :client_applications, :first_name, :string
    add_column :client_applications, :last_name, :string
  end
end
