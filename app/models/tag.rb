class Tag < ApplicationRecord

  has_many :report_tags
  has_many :reports, through: :report_tags

  # 存在しないと保存できないバリデーション カリキュラム/2678
  validates :tagname, presence: true, uniqueness: true
end
