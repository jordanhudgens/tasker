class Project < ActiveRecord::Base
  has_many :tasks

  validates_presence_of :title, :description, :percent_complete

  scope :almost_completed, -> { where('percent_complete > 75.0') }

  after_initialize :set_defaults

  def set_defaults
    self.percent_complete ||= 0.0
  end
end
