class AddReturnedToClientApplications < ActiveRecord::Migration
  def change
    add_column :client_applications, :returned, :boolean
  end
end
