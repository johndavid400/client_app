class AddUnitedStateIdToClientApplications < ActiveRecord::Migration
  def change
    add_column :client_applications, :united_state_id, :integer
  end
end
