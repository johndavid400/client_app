class ClientApplication < ActiveRecord::Base

  has_many :attachments

  state_machine :state, :initial => :blank do
    after_transition :blank => :submitted, :do => :after_submit
    after_transition :submitted => :requested, :do => :after_request
    after_transition :requested => :responded, :do => :after_respond
    after_transition :responded => :completed, :do => :after_complete

    event :submit do
      transition [:blank] => :submitted
    end

    event :requesting do
      transition [:submitted] => :requested
    end

    event :respond do
      transition [:requested] => :responded
    end

    event :complete do
      transition [:responded] => :completed
    end

    state :blank
    state :submitted
    state :requested
    state :responded
    state :completed
  end

  def after_submit
    Client.client_email(self).deliver
  end

  def after_request
    Client.client_email(self).deliver
  end

  def after_respond
    Client.client_email(self).deliver
  end

  def after_complete
    Client.client_email(self).deliver
  end

end
