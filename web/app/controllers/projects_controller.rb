require 'csv'
class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :new, :edit, :update, :download_csv]

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

  # GET /projects/download_csv/<project.id>
  def download_csv
    answers = {developer: {}, manager: {}, quality_control: {}}
    DeveloperAnswer.where(project_id: @project.id).each do |answer|
      answers[:developer][answer.quality_point_id] = answer
    end
    ManagerAnswer.where(project_id: @project.id).each do |answer|
      answers[:manager][answer.quality_point_id] = answer
    end
    QualityControlAnswer.where(project_id: @project.id).each do |answer|
      answers[:quality_control][answer.quality_point_id] = answer
    end

    sections = Section.all.map{|section| [section.id, section.name] }.to_h

    headers = %w(管理番号 案件名 チェックタイミング タイトル チェック内容 過去障害 備考 担当者チェックステータス 担当者コメント 担当者 チェック日 承認者チェックステータス 承認者コメント 承認者 チェック日 品管チェックステータス 品管コメント 品管担当 チェック日)
    csv_data = CSV.generate(headers: headers, write_headers: true, force_quotes: true) do |csv|
      QualityPoint.all.each do |point|
        tmp = Array.new

        next if answers[:developer][point.id].blank? && answers[:manager][point.id].blank? && answers[:quality_control][point.id].blank?
        tmp << @project.code
        tmp << @project.title
        tmp << sections[answers[:developer][point.id].section_id]
        tmp << point.title
        tmp << point.question
        tmp << point.warnings
        tmp << '' # TODO: Add 備考 when 備考 is added
        tmp << answers[:developer][point.id].status
        tmp << answers[:developer][point.id].comment
        tmp << answers[:developer][point.id].developer_name
        tmp << answers[:developer][point.id].updated_at.strftime('%Y-%m-%d')
        tmp << answers[:manager][point.id].status
        tmp << answers[:manager][point.id].comment
        tmp << answers[:manager][point.id].manager_name
        tmp << answers[:manager][point.id].updated_at.strftime('%Y-%m-%d')
        tmp << answers[:quality_control][point.id].status
        tmp << answers[:quality_control][point.id].comment
        tmp << answers[:quality_control][point.id].quality_control_name
        tmp << answers[:quality_control][point.id].updated_at.strftime('%Y-%m-%d')

        csv << tmp
      end
    end

    send_data csv_data, type: 'text/csv; charset=shift_jis', filename: "#{@project.title}.csv"

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
