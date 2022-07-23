require 'rails_helper'

RSpec.describe Wunderlist, type: :model do
  describe 'associations' do
    it { should belong_to(:wunderfolder) }
    it { should have_many(:wundertasks) }
  end


  describe 'from hash' do
    let(:hash_list) { { "id": 34496580, "title": "7 Stills", "folder": nil, "tasks": [], "directoryPath": "7 Stills", "textFilePath": "7 Stills/7 Stills.txt", "htmlFilePath": "7 Stills/7 Stills.html", "createdAt": "2012-12-06T04:51:13.98Z" } }
    let(:list) { Wunderlist.new }

    context 'is not completed' do
      before(:each) do
        list.from_hash hash_list
      end

      it 'sets original_id to the it' do
        expect(list.original_id).to eq(hash_list["id"])
      end

      it 'sets title to the title' do
        expect(list.title).to eq(hash_list["title"])
      end

      it 'sets createdAt to the createdAt' do
        expect(list.createdAt).to eq(hash_list["createdAt"])
      end

      it 'sets completedAt to the updatedAt' do
        expect(list.updatedAt).to eq(hash_list["updatedAt"])
      end
    end
  end


end


    # original_id    { 1 }
    # title          { "this is a folder" }
    # directory_path { "this is the directory_path" }
    # text_file_path { "this is the text_file_path" }
    # html_file_path { "this is the html_file_path" }
