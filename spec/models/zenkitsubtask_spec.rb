require 'rails_helper'

RSpec.describe Zenkitsubtask, type: :model do
  it { should belong_to(:zenkittask) }
end
