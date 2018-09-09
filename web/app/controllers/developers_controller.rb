class DevelopersController < ApplicationController
  before_action :set_project, :set_section

  def index
  end

private
  def set_project
    @project = Project.where(id: params[:id]).first

    # Return false when project wasn't found
    !@project.blank?
  end

  def set_section
    section = Section.where(id: params[:section_id]).first

    # Return false when project wasn't found
    @section_id = section.blank? ? Section.order(id: :desc).first.id : section.id
  end
end
