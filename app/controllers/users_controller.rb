class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user.new(params[:user])
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to new_client_application_path
    else
      render :new
    end
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
