class HomeController < ApplicationController

  def index
    @applications = ClientApplication.all
  end

  def finished
    @application = ClientApplication.last
  end

end
