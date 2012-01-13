class AddAttachmentColumnsToClientApplications < ActiveRecord::Migration
  def self.up
    add_column :client_applications, :articles_of_incorporation, :boolean
    add_column :client_applications, :proof_of_insurance, :boolean
    add_column :client_applications, :business_license, :boolean
    add_column :client_applications, :partnership_agreement, :boolean
    add_column :client_applications, :limited_partnership, :boolean
    add_column :client_applications, :charter, :boolean
    add_column :client_applications, :association_resolution, :boolean
    add_column :client_applications, :irs_tax_exemption_form, :boolean
    add_column :client_applications, :bank_statements, :boolean
    add_column :client_applications, :tax_returns, :boolean
    add_column :client_applications, :litigation_information, :boolean
    add_column :client_applications, :banking_information, :boolean
    add_column :client_applications, :principal_information, :boolean
  end

  def self.down
    remove_column :client_applications, :principal_information
    remove_column :client_applications, :banking_information
    remove_column :client_applications, :litigation_information
    remove_column :client_applications, :litigation
    remove_column :client_applications, :tax_returns
    remove_column :client_applications, :bank_statements
    remove_column :client_applications, :irs_tax_exemption_form
    remove_column :client_applications, :association_resolution
    remove_column :client_applications, :charter
    remove_column :client_applications, :limited_partnership
    remove_column :client_applications, :partnership_agreement
    remove_column :client_applications, :business_license
    remove_column :client_applications, :proof_of_insurance
    remove_column :client_applications, :articles_of_incorporation
  end
end
