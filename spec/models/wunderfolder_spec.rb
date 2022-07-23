require 'rails_helper'

RSpec.describe Wunderfolder, type: :model do
  describe 'associations' do
    it { should have_many(:wunderlists) }
  end

  describe 'from hash' do
    let(:hash_folder) { {"title": "the title", "directoryPath": "the directory path", "createdAt": "2016-12-19T18:15:51.952Z", "updatedAt": "2019-08-18T03:48:55.746Z"} }
    let(:folder) { Wunderfolder.new }

    context 'is not completed' do
      before(:each) do
        folder.from_hash hash_folder
      end

      it 'sets title to the title' do
        expect(folder.title).to eq(hash_folder[:title])
      end

      it 'sets directory_path to the directory_path' do
        expect(folder.directory_path).to eq(hash_folder[:directoryPath])
      end

      it 'sets createdAt to the createdAt' do
        expect(folder.createdAt).to eq(hash_folder[:createdAt])
      end

      it 'sets completedAt to the updatedAt' do
        expect(folder.updatedAt).to eq(hash_folder[:updatedAt])
      end
    end
  end

  describe 'find_or_create' do
    let(:hash_folder) { {"title": "the title", "directoryPath": "the directory path", "createdAt": "2016-12-19T18:15:51.952Z", "updatedAt": "2019-08-18T03:48:55.746Z"} }

    context 'input is nil' do
      it 'returns nil' do
        folder         = Wunderfolder.find_or_create nil
        count_final    = Wunderfolder.count

        expect(count_final).to eq( 0 )
        expect(folder     ).to be_nil
      end
    end

    context 'there are none' do
      it 'creates one' do
        count_original = Wunderfolder.count
        folder         = Wunderfolder.find_or_create hash_folder
        count_final    = Wunderfolder.count

        expect(count_original).to eq( 0 )
        expect(count_final   ).to eq( 1 )
        expect(folder.class  ).to eq( Wunderfolder )
        expect(folder.title  ).to eq(hash_folder[:title])
      end
    end

    context 'this on exists' do
      it 'creates one' do
        count_original = Wunderfolder.count
        folder1        = Wunderfolder.find_or_create hash_folder
        count_middle   = Wunderfolder.count
        folder2        = Wunderfolder.find_or_create hash_folder
        count_final    = Wunderfolder.count

        expect(count_original).to eq( 0 )
        expect(count_middle  ).to eq( 1 )
        expect(count_final   ).to eq( 1 )
        expect(folder2.class ).to eq( Wunderfolder )
        expect(folder2.title ).to eq(hash_folder[:title])
      end
    end
  end
end
