class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :new, :edit, :update]

  # GET /projects/new
  def new
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.valid?
      @project.save!
      render json: { redirect_url: root_path }, status: :ok
    else
      render json: { errors: @project.errors.full_messages }, status: 422
    end
  end

private
  # Get the project that we will use
  def set_project
    @project = params[:id].blank? ? Project.new : Project.find(params[:id])
  end

  # Whitelist mass-assign parameters
  def project_params
    params.require(:project).permit(
      :title,
      :service_id,
      :owner,
      :url
    )
  end
end
