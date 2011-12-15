class AddAttachmentColumnsToClientApplications < ActiveRecord::Migration
  def self.up
    add_column :client_applications, :attachment_file_name, :string
    add_column :client_applications, :attachment_content_type, :string
    add_column :client_applications, :attachment_file_size, :integer
    add_column :client_applications, :attachment_updated_at, :datetime
  end

  def self.down
    remove_column :client_applications, :attachment_updated_at
    remove_column :client_applications, :attachment_file_size
    remove_column :client_applications, :attachment_content_type
    remove_column :client_applications, :attachment_file_name
  end
end
