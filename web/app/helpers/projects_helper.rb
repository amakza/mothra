module ProjectsHelper
  def get_status(project_id)
    if DeveloperAnswer.where(project_id: project_id).where('status = 0 OR status = 3').count > 0
      '未完了'
    elsif ManagerAnswer.where(project_id: project_id).where('status = 0 OR status = 3').count > 0
      '承認者確認待ち'
    elsif QualityControlAnswer.where(project_id: project_id).where('status = 0 OR status = 3').count > 0
      '品管承認待ち'
    else
      '完了'
    end
  end
end
