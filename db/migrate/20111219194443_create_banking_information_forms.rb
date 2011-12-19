class CreateBankingInformationForms < ActiveRecord::Migration
  def change
    create_table :banking_information_forms do |t|
      t.string :bank_name
      t.string :bank_address
      t.string :contact_person
      t.string :phone_number
      t.string :previous_bank
      t.integer :client_application_id

      t.timestamps
    end
  end
end
