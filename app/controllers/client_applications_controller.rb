class ClientApplicationsController < ApplicationController

  def show
    @application = ClientApplication.find(params[:id])
  end

  def new
    @application = ClientApplication.new
  end

  def create
    @application = ClientApplication.new(params[:client_application])
    if @application.save
      @application.submit!
      @application.update_attributes(:progress => 25)
      @user = User.new(:email => @application.email, :password => "password", :password_confirmation => "password")
      if @user.save
        # would like to refactor here!!
        @application.update_attributes(:user_id => @user.id)
        redirect_to "/"
        flash[:notice] = "Application submitted successfully"
      end
    else
      render 'new'
      error_message = @application.errors.full_messages.first
      flash[:error] = "Application Failed to submit! " + " " + error_message
    end
  end

  def edit
    @application = ClientApplication.find(params[:id])
    @principal_information_form = @application.principal_information_forms.build
    @banking_information_form = @application.banking_information_forms.build
    @selected = @application.attributes.select{|k, v| v == true}
    unless @selected.empty?
      @selected.each do |param|
       @application.attachments.find_or_create_by_description(param.first)
      end
    end
    render @application.application_state
  end

  def update
    @application = ClientApplication.find(params[:id])
    update_state
  end

  def update_state
    @application.update_attributes(params[:client_application])
    if @application.application_state == "submitted"
      @application.requesting!
      @application.update_attributes(:progress => 50)
      message = "This application has been sent in for request"
    elsif @application.application_state == "requested"
      @application.respond!
      @application.update_attributes(:progress =>  75)
      message = "This application has been sent in for response"
    elsif @application.application_state == "responded"
      if @application.returned?
        @application.submit!
        @application.update_attributes(:progress => 25)
        message = "This application has been flagged for further review."
      else
        @application.complete!
        @application.update_attributes(:progress => 100)
        message = "This application is complete"
      end
    elsif @application.application_state == "completed"
      message = "This application is really complete"
    end
    redirect_to "/"
    flash[:notice] = message
  end

  def add_attachments
     @application = ClientApplication.find(params[:application_id])
     update_state
  end

  def destroy
    @application = ClientApplication.find(params[:id])
    @application.destroy
    redirect_to :back
    flash[:notice] = "Client Application successfully deleted"
  end

end
