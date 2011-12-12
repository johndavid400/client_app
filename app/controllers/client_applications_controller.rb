class ClientApplicationsController < ApplicationController
  # GET /applications
  # GET /applications.json
  def index
    @applications = ClientApplication.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applications }
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @application = ClientApplication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/new
  # GET /applications/new.json
  def new
    @application = ClientApplication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/1/edit
  def edit
    @application = ClientApplication.find(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = ClientApplication.new(params[:application])

    respond_to do |format|
      if @application.save
        format.html { redirect_to home_finished_path, notice: 'Application was successfully created.' }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render action: "new" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applications/1
  # PUT /applications/1.json
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

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application = ClientApplication.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to client_applications_url }
      format.json { head :ok }
    end
  end
end
