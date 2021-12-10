class Wunderlist < ApplicationRecord
  belongs_to :wunderfolder
  has_many :wundertasks
end
