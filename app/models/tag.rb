class Tag < ApplicationRecord

  has_ancestry
  has_many :possessions
  has_many :reports, through: :possessions
  
  has_many :registrations
  has_many :users, through: :registrations

  # 存在しないと保存できないバリデーション カリキュラム/2678
  validates :name, presence: true, uniqueness: true
end
