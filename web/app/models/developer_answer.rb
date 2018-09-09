class DeveloperAnswer < ActiveRecord::Base
  belongs_to :project

  def DeveloperAnswer.create_answer_set(project_id)
    QualityPoint.all_shown.each do |point|
      DeveloperAnswer.create({
        project_id: project_id,
        quality_point_id: point.id,
        section_id: point.section_id,
        status: 0,
        comment: ''
      })
    end
  end
end
