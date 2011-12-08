class HomeController < ApplicationController

  def index
    @applications = Application.all
  end

end
