class ClientApplicationsController < ApplicationController
  def index
    @applications = ClientApplication.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applications }
    end
  end

  def show
    @application = ClientApplication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application }
    end
  end

  def new
    @application = ClientApplication.new
  end

  def edit
    @application = ClientApplication.find(params[:id])
  end

  def create
    @application = ClientApplication.new(params[:application])
    if @application.save
      Initial.initial_email(@application).deliver
    end
    redirect_to home_finished_path
  end

  def update
    @application = ClientApplication.find(params[:id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        format.html { redirect_to @application, notice: 'ClientApplication was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @application = ClientApplication.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to client_applications_url }
      format.json { head :ok }
    end
  end
end
