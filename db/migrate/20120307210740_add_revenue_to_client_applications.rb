class AddRevenueToClientApplications < ActiveRecord::Migration
  def change
    add_column :client_applications, :revenue, :string
  end
end
