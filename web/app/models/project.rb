class Project < ActiveRecord::Base
  has_many :developer_answers
  has_many :manager_answers
  has_many :quality_control_answers

  validates :title,
    presence: true,
    length: { maximum: 255 }
  validates :service_id,
    presence: true
  validates :owner,
    presence: true,
    length: { maximum: 255 }
  validates :url,
    length: { maximum: 200 },
    format: { with: /\A(http|https):\/\/.*\Z/, allow_blank: true }

  before_save :set_code

private
  # Before saving set the code based on the service
  def set_code
    service = Service.find(service_id)
    self.code = "#{service.code}-#{Time.now.strftime('%Y%m%d%H%M%S')}"
  end
end
