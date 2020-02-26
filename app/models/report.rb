class Report < ApplicationRecord

  belongs_to :user
  has_many :report_tags
  has_many :tags, through: :report_tags
end
