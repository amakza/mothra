class HomeController < ApplicationController
  # GET /
  # GET /home/index
  def index
    @projects = Project.all
  end
end
