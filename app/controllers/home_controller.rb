class HomeController < ApplicationController
  def index
    @applications = ClientApplication.all
  end
end
