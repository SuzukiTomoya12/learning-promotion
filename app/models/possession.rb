class Possession < ApplicationRecord

  belongs_to :report
  belongs_to :tag
end
