class PrincipalInformationForm < ActiveRecord::Base
  belongs_to :client_application
  attr_encrypted :ssn, :key => 'client_app'
end
