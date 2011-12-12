class ClientApplication < ActiveRecord::Base
#  after_create :send_initial_email

  def send_initial_email
    Initial.initial_email(@application).deliver
  end
end
