class Registration < ApplicationRecord

  belongs_to :user
  belongs_to :tag
  has_one  :experience_point
end



