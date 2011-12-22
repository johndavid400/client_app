class EncryptSsn < ActiveRecord::Migration
  def up
    remove_column :principal_information_forms, :ssn
    add_column    :principal_information_forms, :encrypted_ssn, :string
  end

  def down
    remove_column :principal_information_forms, :encrypted_ssn
    add_column :principal_information_forms, :ssn
  end
end
