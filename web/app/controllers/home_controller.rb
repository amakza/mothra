class HomeController < ApplicationController
  before_action :set_page

  # GET /
  # GET /home/index
  def index
    @projects = Project.all.order(created_at: :desc).page(@page).per(20)
  end

private
  def set_page
    @page = params[:page] || 1
  end

  # GET /home/styleguide
  def styleguide
  end
end
