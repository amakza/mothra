class ManagerAnswer < ActiveRecord::Base
  belongs_to :project

  def ManagerAnswer.create_answer_set(project_id)
    QualityPoint.all_shown.each do |point|
      ManagerAnswer.create({
        project_id: project_id,
        quality_point_id: point.id,
        status: 0,
        comment: ''
      })
    end
  end

end
