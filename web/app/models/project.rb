class Project < ActiveRecord::Base
  has_many :developer_answers
  has_many :manager_answers
  has_many :quality_control_answers

  accepts_nested_attributes_for :developer_answers,
                                :manager_answers,
                                :quality_control_answers

  attr_accessor :developer_name, :manager_name, :quality_control_name

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
  after_save :create_answers

  # TODO: Move this to somewhere appropiate
  ANSWER_CODE = { ok: 1, ok_check: 2, ng: 3, no_check: 9 }
  ANSWER_STATUS = {
    ok: {
      status: 1,
      tooltip: 'OK',
      label_class: 'ok',
      icon_class: 'fas fa-check',
    },
    ok_check: {
      status: 2,
      tooltip: 'OK(条件付き)',
      label_class: 'ok-check',
      icon_class: 'fas fa-user-check',
    },
    ng: {
      status: 3,
      tooltip: 'NG',
      label_class: 'ng',
      icon_class: 'fas fa-times',
    },
    no_check: {
      status: 9,
      tooltip: '対象外',
      label_class: 'no-check',
      icon_class: 'fas fa-low-vision',
    },
  }

private
  # Before saving set the code based on the service
  def set_code
    service = Service.find(service_id)
    self.code = "#{service.code}-#{Time.now.strftime('%y%m%d%H%M')}"
  end

  def create_answers
    DeveloperAnswer.create_answer_set(self.id)
    ManagerAnswer.create_answer_set(self.id)
    QualityControlAnswer.create_answer_set(self.id)
  end
end
