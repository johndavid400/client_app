class ClientApplicationsController < ApplicationController

  before_filter :admin_required, :only => [:index, :show, :destroy]
  before_filter :login_required, :only => [:edit]

  def index
    @client_applications = ClientApplication.all
  end

  def show
    @client_application = ClientApplication.find(params[:id])
  end

  def new
    @client_application = ClientApplication.new
  end

  def create
    @client_application = ClientApplication.new(params[:client_application])
    if @client_application.save
      @client_application.submit!
      @client_application.update_attributes(:progress => 25)
      @user = User.new(:email => @client_application.email, :password => @client_application.password, :password_confirmation => @client_application.password )
      if @user.save
        # would like to refactor here!!
        @client_application.update_attributes(:user_id => @user.id)
        redirect_to "/"
        flash[:notice] = "Application submitted successfully"
      end
    else
      render 'new'
      error_message = @client_application.errors.full_messages.first
      flash[:error] = error_message
    end
  end

  def edit
    @client_application = ClientApplication.find(params[:id])
    if !verify_user
      redirect_to root_path
    else
      unless @client_application.principal_information_forms.present?
        @principal_information_form = @client_application.principal_information_forms.build
      end
      unless @client_application.banking_information_forms.present?
        @banking_information_form = @client_application.banking_information_forms.build
      end
#      @selected = @client_application.attributes.select{|k, v| v == true}
      @selected = @client_application.attributes.select{|k, v| v == true && k != "returned" && k != "contact_by_email"}
      unless @selected.empty?
        @selected.each do |param|
         @client_application.attachments.find_or_create_by_description(param.first)
        end
      end
      render @client_application.application_state
    end
  end

  def update
    @client_application = ClientApplication.find(params[:id])
    update_state
  end

  def destroy
    @client_application = ClientApplication.find(params[:id])
    @client_application.destroy
    redirect_to :back
    flash[:notice] = "Client Application successfully deleted"
  end

  def update_state
    # fix me - needs to not update attributes if they already exists... it is currently overwriting old values to add new ones.
    @client_application.update_attributes(params[:client_application])
    if @client_application.application_state == "submitted"
      @client_application.requesting!
      @client_application.update_attributes(:progress => 50)
      message = "This application has been sent in for request"
    elsif @client_application.application_state == "requested"
      @client_application.respond!
      @client_application.update_attributes(:progress =>  75)
      message = "This application has been sent in for response"
    elsif @client_application.application_state == "responded"
      if @client_application.returned?
        @client_application.submit!
        @client_application.update_attributes(:progress => 25)
        message = "This application has been flagged for further review."
      else
        @client_application.complete!
        @client_application.update_attributes(:progress => 100)
        message = "This application is complete"
      end
    end
    redirect_to "/"
    flash[:notice] = message
  end

  def add_attachments
     @client_application = ClientApplication.find(params[:application_id])
     update_state
  end

  def verify_user
    @client_application.user == current_user || current_user.admin?
  end


end
