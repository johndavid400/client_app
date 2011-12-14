class AddDragonflyFieldsToClientApplications < ActiveRecord::Migration
  def self.up
    add_column :client_applications, :attachment_uid, :string
    add_column :client_applications, :attachment_name, :string
  end

  def self.down
    remove_column :client_applications, :attachment_name
    remove_column :client_applications, :attachment_uid
  end
end
