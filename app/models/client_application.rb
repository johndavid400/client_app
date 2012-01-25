class ClientApplication < ActiveRecord::Base

  validates_uniqueness_of :email, :business_name
  validates_presence_of :business_name, :first_name, :last_name, :email, :phone_number, :years_in_business, :number_of_employees, :business_address, :billing_address, :city, :zip
  validates_format_of :email, :with => /(\S+)@(\w+.\w+)/

  belongs_to :user
  belongs_to :state
  has_many :attachments, :dependent => :destroy
  has_many :principal_information_forms, :dependent => :destroy
  has_many :banking_information_forms, :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  accepts_nested_attributes_for :principal_information_forms, :allow_destroy => true
  accepts_nested_attributes_for :banking_information_forms, :allow_destroy => true

  # State Machine set up for client applications
  state_machine :application_state, :initial => :incomplete do
    after_transition :incomplete => :submitted, :do => :after_submit
    after_transition :submitted => :requested, :do => :after_request
    after_transition :requested => :responded, :do => :after_respond
    after_transition :responded => :completed, :do => :after_complete

    event :submit do
      transition [:incomplete, :responded] => :submitted
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

    state :incomplete
    state :submitted
    state :requested
    state :responded
    state :completed
  end

  def after_submit
    Client.isotope_email(self).deliver
  end

  def after_request
    Client.client_email(self).deliver
  end

  def after_respond
    Client.isotope_email(self).deliver
  end

  def after_complete
    Client.completed_email(self).deliver
    # send json request to Xrono to create a Client
    create_in_xrono
  end

  def create_in_xrono
    # send the information in the proper format for Xrono to create a client and contact info
    send_to_url = "http://192.168.1.83:3000"
    conn = Faraday.new(:url => send_to_url)
    response = conn.post("/api/v1/clients.json", {"client" => {"name" => self.business_name, "status" => "Inactive"}, "contact" => {"first_name" => self.first_name, "last_name" => self.last_name, "email_address" => self.email, "phone_number" => self.phone_number, "street" => self.business_address, "city" => self.city, "state" => self.state.name, "zip" => self.zip}})
  end

end
