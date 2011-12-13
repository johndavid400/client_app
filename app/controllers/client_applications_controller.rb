class ClientApplicationsController < ApplicationController

  def index
    @applications = ClientApplication.all
  end

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
      redirect_to home_finished_path
      flash[:notice] = "Application submitted successfully"
    else
      redirect_to :back
      flash[:error] = "Application Failed to submit! Please check any errors and try again."
    end
  end

  def edit
    @application = ClientApplication.find(params[:id])
  end

  def update
    @application = ClientApplication.find(params[:id])
  end

  def destroy
    @application = ClientApplication.find(params[:id])
    @application.destroy
  end
end
