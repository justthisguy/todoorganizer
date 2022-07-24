require 'rails_helper'

RSpec.describe Wunderlist, type: :model do
  describe 'associations' do
    it { should belong_to(:wunderfolder) }
    it { should have_many(:wundertasks) }
  end

  describe 'from hash' do
    context 'always' do
      let(:list) { Wunderlist.new }
      let(:hash_list) { { "id": 34496580, "title": "7 Stills", "folder": nil, "tasks": [], "directoryPath": "7 Stills", "textFilePath": "7 Stills/7 Stills.txt", "htmlFilePath": "7 Stills/7 Stills.html", "createdAt": "2012-12-06T04:51:13.98Z" } }

      before(:each) do
        list.from_hash hash_list
      end

      it 'sets original_id to the it' do
        expect(list.original_id).to eq(hash_list[:id])
      end

      it 'sets title to the title' do
        expect(list.title).to eq(hash_list[:title])
      end

      it 'sets createdAt to the createdAt' do
        expect(list.createdAt).to eq(hash_list[:createdAt])
      end
    end

    context 'tasks' do
      let(:list) { Wunderlist.new }
      let(:hash_list) { { "id": 34496580, "title": "7 Stills", "folder": nil, "tasks": [], "directoryPath": "7 Stills", "textFilePath": "7 Stills/7 Stills.txt", "htmlFilePath": "7 Stills/7 Stills.html", "createdAt": "2012-12-06T04:51:13.98Z" } }

      it 'processes tasks' do
        expect_any_instance_of(Wunderlist).to receive(:handle_tasks).exactly(1).time
        list.from_hash hash_list
      end
    end
  end

  describe 'create_from_hash' do
    context 'it has no folder' do
      let(:hash_list) { { "id": 34496580, "title": "7 Stills", "folder": nil, "tasks": [], "directoryPath": "7 Stills", "textFilePath": "7 Stills/7 Stills.txt", "htmlFilePath": "7 Stills/7 Stills.html", "createdAt": "2012-12-06T04:51:13.98Z" } }

      it 'does not try to create one' do
        expect(Wunderfolder).to receive(:find_or_create).exactly(1).time
        Wunderlist.create_from_hash hash_list
      end

      it 'retuns an empty wunderlist' do
        list = Wunderlist.create_from_hash hash_list
        expect(list.class).to eq( Wunderlist )
      end

      it 'retuns a wunderlist whose wunderfolder is nil' do
        list = Wunderlist.create_from_hash hash_list
        expect(list.wunderfolder).to be_nil
      end
    end

    context 'it has a folder' do
      let(:hash_list) { { "id": 34496580, "title": "7 Stills", "folder": {}, "tasks": [], "directoryPath": "7 Stills", "textFilePath": "7 Stills/7 Stills.txt", "htmlFilePath": "7 Stills/7 Stills.html", "createdAt": "2012-12-06T04:51:13.98Z" } }

      it 'does not try to create one' do
        expect(Wunderfolder).to receive(:find_or_create).and_return (FactoryBot.create(:wunderfolder))
        list = Wunderlist.create_from_hash hash_list
        expect(list.class).to eq( Wunderlist )
      end

      it 'returns a wunderlist with no Wunderfolder' do
        expect(Wunderfolder).to receive(:find_or_create).and_return (FactoryBot.create(:wunderfolder))
        list = Wunderlist.create_from_hash hash_list
        expect(list.wunderfolder.class).to eq(Wunderfolder)
      end
    end
  end

  describe 'handle_tasks' do
    context 'has 1 tasks' do
      let(:list) { FactoryBot.create(:wunderlist) }
      it 'tries to create 1 task' do
        expect_any_instance_of(Wundertask).to receive(:from_hash).exactly(1).time
        list.handle_tasks [{}]
      end
    end

    context 'has 2 tasks' do
      let(:list) { FactoryBot.create(:wunderlist) }
      it 'tries to create 2 tasks' do
        count = 0
        allow_any_instance_of(Wundertask).to receive(:from_hash) { count += 1 }
        list.handle_tasks [{},{}]
        expect(count).to eq( 2 )
      end
    end
  end
end

