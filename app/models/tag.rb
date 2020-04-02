class Tag < ApplicationRecord

  has_ancestry
  has_many :report_tags
  has_many :reports, through: :report_tags

  # 存在しないと保存できないバリデーション カリキュラム/2678
  validates :name, presence: true, uniqueness: true
end
