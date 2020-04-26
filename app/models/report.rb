class Report < ApplicationRecord

  belongs_to :user
  has_many :possessions
  has_many :tags, through: :possessions


  validates :total_time_hour, presence: true
  validates :total_time_minute, presence: true
  validates :concentration_time_hour, presence: true
  validates :concentration_time_minute, presence: true

end
