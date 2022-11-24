require 'rails_helper'

RSpec.describe Zenkitfolder, type: :model do
    it { should have_many(:zenkitlists) }
end
