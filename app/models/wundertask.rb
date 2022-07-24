class Wundertask < ApplicationRecord
  belongs_to :wunderlist
  has_many :wundersubtasks

  def from_hash source
    return nil
  end
end
