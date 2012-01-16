class ApplicationController < ActionController::Base
  protect_from_forgery

  def login_required
    redirect_to(new_user_session_path) if current_user.blank?
  end

  def admin_required
    if !current_user.blank?
      if !current_user.admin?
        redirect_to '/'
        flash[:error] = "You must be an Admin to do that!"
      end
    else
      redirect_to "/"
      flash[:error] = "You must be logged in to do that!"
    end
  end

end
