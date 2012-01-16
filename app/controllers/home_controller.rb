class HomeController < ApplicationController
  def index
    if !current_user.blank?
      if current_user.admin?
        redirect_to client_applications_path
        flash[:notice] = "Welcome to the Admin Client Application listing"
      end
    end
  end
end
