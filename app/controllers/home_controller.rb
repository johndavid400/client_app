class HomeController < ApplicationController

  def index
    @applications = Application.all
  end

  def finished
    @application = Application.last
  end

end
