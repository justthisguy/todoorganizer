require 'rails_helper'

RSpec.describe Wunderfolder, type: :model do
  describe 'associations' do
    it { should have_many(:wunderlists) }
  end

  describe 'from hash' do
    let(:hash_folder) { {"title"=>"TODO", "directoryPath"=>"the directory path", "createdAt"=>"2016-12-19T18:15:51.952Z", "updatedAt"=>"2019-08-18T03:48:55.746Z"} }
    let(:folder) { Wunderfolder.new }

    context 'is not completed' do
      before(:each) do
        folder.from_hash hash_folder
      end

      it 'sets title to the title' do
        expect(folder.title).to eq(hash_folder["title"])
      end

      it 'sets completed to the directory_path' do
        expect(folder.directory_path).to eq(hash_folder["directoryPath"])
      end

      it 'sets createdAt to the createdAt' do
        expect(folder.createdAt).to eq(hash_folder["createdAt"])
      end

      it 'sets completedAt to the updatedAt' do
        expect(folder.updatedAt).to eq(hash_folder["updatedAt"])
      end
    end
  end
end
