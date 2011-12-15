class Attachment < ActiveRecord::Base

  belongs_to :client_application
  has_attached_file :document

end
