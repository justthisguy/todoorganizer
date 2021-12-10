class Wundertask < ApplicationRecord
  belongs_to :wunderlist
  has_many :wundersubtasks
end
