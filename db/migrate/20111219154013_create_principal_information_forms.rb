class CreatePrincipalInformationForms < ActiveRecord::Migration
  def change
    create_table :principal_information_forms do |t|
      t.string :name
      t.string :alternate_name
      t.string :ssn
      t.string :dob
      t.string :dl_number
      t.string :dl_state
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :prev_street_address
      t.string :prev_city
      t.string :prev_state
      t.string :prev_zip
      t.string :prev_county
      t.string :position
      t.string :company
      t.string :years_with_company
      t.string :prev_employer
      t.string :date
      t.integer :client_application_id

      t.timestamps
    end
  end
end
