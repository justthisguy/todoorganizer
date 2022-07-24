require 'rails_helper'

RSpec.describe Wundersubtask, type: :model do
  describe 'associations' do
    it { should belong_to(:wundertask) }
  end

  describe 'from hash' do
    let(:tast) { FactoryBot.create :wundertask }
    let(:hst1) { { "title": "what needs doing", "completed": false, "completedAt": nil, "createdAt": "2018-07-07T20:03:51.994Z", "createdBy": { "id": 1344494, "name": "wunderlist@justthisguy.org", "email": "wunderlist@justthisguy.org", "createdAt": "2011-10-04T03:16:24Z" } } }
    let(:hst2) { { "title": "what's been done", "completed": true,  "completedAt": "2018-07-31T16:22:52.731Z", "createdAt": "2018-07-07T20:03:51.994Z", "createdBy": { "id": 1344494, "name": "wunderlist@justthisguy.org", "email": "wunderlist@justthisguy.org", "createdAt": "2011-10-04T03:16:24Z" } } }
    let(:date) { DateTime.parse "2018-07-07T20:03:51.994Z" }
    let(:subtask) { tast.wundersubtasks.create }

    context 'is not completed' do
      before(:each) do
        subtask.from_hash hst1
      end

      it 'sets title to the title' do
        expect(subtask.title).to eq( hst1[:title] )
      end

      it 'sets createdAt to the createdAt' do
        expect(subtask.createdAt).to eq( DateTime.parse hst1[:createdAt] )
      end

      it 'sets completed to false' do
        expect(subtask.completed).to be false
      end

      it 'sets completedAt to null' do
        expect(subtask.completedAt).to be_nil
      end
    end

    context 'is completed' do
      before(:each) do
        subtask.from_hash hst2
      end

      it 'sets title to the title' do
        expect(subtask.title).to eq( hst2[:title] )
      end

      it 'sets createdAt to the createdAt' do
        expect(subtask.createdAt).to eq( DateTime.parse hst2[:createdAt] )
      end

      it 'sets completed to false' do
        expect(subtask.completed).to be true
      end

      it 'sets completedAt to completedAt' do
        expect(subtask.completedAt).to eq( DateTime.parse hst2[:completedAt] )
      end
    end
  end
end
