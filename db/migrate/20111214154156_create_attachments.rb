class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :file_uid
      t.string :file_name
      t.integer :client_application_id

      t.timestamps
    end
  end
end
