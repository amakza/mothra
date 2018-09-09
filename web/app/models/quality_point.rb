class QualityPoint < ActiveRecord::Base
  belongs_to :quality_point_section

  scope :all_shown, -> do
    all.where(is_shown: true)
  end

end
