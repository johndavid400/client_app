class AddBusinessTypesToClientApplications < ActiveRecord::Migration
  def change
    add_column :client_applications, :business_type, :string
    add_column :client_applications, :market_symbol, :string
    add_column :client_applications, :other_type, :string
  end
end
