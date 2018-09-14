class ManagersController < ApplicationController
  before_action :set_project, only: :index
  before_action :set_section, only: :index

  # GET /managers/<project.id>/<section.id>
  def index
  end

  # PATCH /managers/<manager_answer.id>
  # JSON
  def update
    answer = ManagerAnswer.find(params[:id])

    if answer.update(answer_params)
      render json: { comment: !answer.comment.blank? }, status: :ok
    else
      render json: { errors: "Couldn't save" }, status: 422
    end
  end

  # GET /managers/get_comment/<manager_answer.id>
  # Returns the manager_answer comment
  # JSON
  def get_comment
    if params[:id].blank?
      render json: { errors: 'answer_id required' }, status: 422
      return
    end

    answer = ManagerAnswer.where(id: params[:id]).first

    if answer.blank?
      render json: { errors: 'Answer not found' }, status: 422
    else
     render json: { comment: answer.comment }, status: :ok
    end

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

  def answer_params
    params.require(:answer).permit(:comment, :status)
  end
end
