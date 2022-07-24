require 'rails_helper'

RSpec.describe Wundertask, type: :model do
  describe 'associations' do
    it { should belong_to(:wunderlist) }
    it { should have_many(:wundersubtasks) }
  end
end
