class QualityPoint < ActiveRecord::Base
  belongs_to :section

  scope :all_shown, -> do
    all.where(is_shown: true)
  end

end
