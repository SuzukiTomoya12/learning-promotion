class Tag < ApplicationRecord

  has_ancestry
  has_many :reports_tags
  has_many :reports, through: :reports_tags
  
  has_many :users_tags
  has_many :users, through: :users_tags

  # 存在しないと保存できないバリデーション カリキュラム/2678
  validates :name, presence: true, uniqueness: true
end
