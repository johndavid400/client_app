class AddAttachmentColumnsToClientApplications < ActiveRecord::Migration
  def self.up
    add_column :client_applications, :articles_of_incorporation_file_name, :string
    add_column :client_applications, :proof_of_insurance_file_name, :string
    add_column :client_applications, :business_license_file_name, :string
    add_column :client_applications, :partnership_agreement_file_name, :string
    add_column :client_applications, :limited_partnership_file_name, :string
    add_column :client_applications, :charter_file_name, :string
    add_column :client_applications, :association_resolution_file_name, :string
    add_column :client_applications, :irs_tax_exempt_status_form_file_name, :string
    add_column :client_applications, :bank_statement_file_name, :string
    add_column :client_applications, :tax_return_one_file_name, :string
    add_column :client_applications, :tax_return_two_file_name, :string
    add_column :client_applications, :litigation_file_name, :string
    add_column :client_applications, :banking_information, :boolean
    add_column :client_applications, :principal_information, :boolean
  end

  def self.down
    remove_column :client_applications, :tax_return_two_file_name
    remove_column :client_applications, :tax_return_one_file_name
    remove_column :client_applications, :bank_statement_file_name
    remove_column :client_applications, :irs_tax_exempt_status_form_file_name
    remove_column :client_applications, :association_resolution_file_name
    remove_column :client_applications, :charter_file_name
    remove_column :client_applications, :limited_partnership_file_name
    remove_column :client_applications, :partnership_agreement_file_name
    remove_column :client_applications, :business_license_file_name
    remove_column :client_applications, :proof_of_insurance_file_name
    remove_column :client_applications, :articles_of_incorporation_file_name
    remove_column :client_applications, :banking_information
    remove_column :client_applications, :principal_information
  end
end
