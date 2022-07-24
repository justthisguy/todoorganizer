require 'rails_helper'

RSpec.describe Wundertask, type: :model do
  describe 'associations' do
    it { should belong_to(:wunderlist) }
    it { should have_many(:wundersubtasks) }
  end

  describe 'from hash' do
    context 'always' do
      let(:task) { Wundertask.new }
      let(:hash_task) { { "id": 4158461911, "title": "vinegar", "completed": true, "starred": false, "subtasks": [], "notes": [], "comments": [], "reminders": [], "files": [], "assignee": nil, "dueDate": nil, "createdAt": "2018-08-25T01:34:54.968Z", "createdBy": { "id": 1344494, "name": "wunderlist@justthisguy.org", "email": "wunderlist@justthisguy.org", "createdAt": "2011-10-04T03:16:24Z" }, "completedAt": "2019-07-05T21:47:57.425Z", "completedBy": { "id": 1344494, "name": "wunderlist@justthisguy.org", "email": "wunderlist@justthisguy.org", "createdAt": "2011-10-04T03:16:24Z" } } }

      before(:each) do
        task.from_hash hash_task
      end

      it 'sets original_id to the it' do
        expect(task.original_id).to eq(hash_task[:id])
      end

      it 'sets title to the title' do
        expect(task.title).to eq(hash_task[:title])
      end

      it 'sets completed to the completed' do
        expect(task.completed).to eq(hash_task[:completed])
      end

      it 'sets starred to the starred' do
        expect(task.starred).to eq(hash_task[:starred])
      end

      it 'sets createdAt to the createdAt' do
        expect(task.createdAt).to eq(hash_task[:createdAt])
      end

      it 'sets completedAt to the completedAt' do
        expect(task.completedAt).to eq(hash_task[:completedAt])
      end
    end
  end





end
