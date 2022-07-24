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

  describe 'handle_notes' do
    let(:task) { FactoryBot.create(:wundertask) }

    context 'has 0 notes' do
      it 'does not try to create a note' do
        expect_any_instance_of(Wundertask).to_not receive(:note_from_hash)
        task.handle_notes []
      end
    end

    context 'has 1 notes' do
      it 'tries to create 1 note' do
        expect_any_instance_of(Wundertask).to receive(:note_from_hash).exactly(1).time
        task.handle_notes [{}]
      end
    end

    context 'has 2 notes' do
      it 'tries to create 2 notes' do
        count = 0
        allow_any_instance_of(Wundertask).to receive(:note_from_hash) { count += 1 }
        task.handle_notes [{},{}]
        expect(count).to eq( 2 )
      end
    end
  end

  describe 'note_from_hash' do
    let(:task) { FactoryBot.create(:wundertask) }

    context 'note is empty' do
      let(:note_hash) { {} }
      it 'returns false' do
        result = task.note_from_hash note_hash
        expect(result).to be false
      end
    end

    context 'content is empty' do
      let(:note_hash) { { "content": "" } }
      it 'returns false' do
        result = task.note_from_hash note_hash
        expect(result).to be false
      end
    end

    context 'it is a good note' do
      let(:note_hash) { { "content": "this is the note" } }
      it 'creates a new note' do
        result = task.note_from_hash note_hash
        expect(task.notes.count).to eq( 1 )
      end

      it 'the new note contains the right string' do
        result = task.note_from_hash note_hash
        expect(task.notes.first).to eq( note_hash[:content] )
      end
    end
  end

  describe 'handle_subtasks' do
    let(:task) { FactoryBot.create(:wundertask) }

    context 'has 0 subtasks' do
      it 'does not try to create a subtask' do
        expect_any_instance_of(Wundersubtask).to_not receive(:from_hash)
        task.handle_subtasks []
      end
    end

    context 'has 1 subtasks' do
      it 'tries to create 1 subtask' do
        expect_any_instance_of(Wundersubtask).to receive(:from_hash).exactly(1).time
        task.handle_subtasks [{}]
      end
    end

    context 'has 2 subtasks' do
      it 'tries to create 2 subtasks' do
        count = 0
        allow_any_instance_of(Wundersubtask).to receive(:from_hash) { count += 1 }
        task.handle_subtasks [{},{}]
        expect(count).to eq( 2 )
      end
    end
  end






end
