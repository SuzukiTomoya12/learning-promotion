class Report < ApplicationRecord

  belongs_to :user
  has_many :report_tags
  has_many :tags, through: :report_tags


  validates :total_time_hour, presence: true
  validates :total_time_minute, presence: true
  validates :concentration_time_hour, presence: true
  validates :concentration_time_minute, presence: true

end
