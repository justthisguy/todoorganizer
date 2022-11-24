require 'rails_helper'

RSpec.describe Zenkitlist, type: :model do
  it { should belong_to(:zenkitfolder) }
  it { should have_many(:zenkittasks) }

  describe 'create_from' do
    context 'happy path' do
      let(:folder) { FactoryBot.create(:zenkitfolder) }
      let(:title ) { "random title" }


      it 'creates one new Zenkitlist' do
        count_original = Zenkitlist.count
        list           = Zenkitlist.create_from folder, title, []
        count_final    = Zenkitlist.count

        expect(count_final ).to eq( count_original + 1 )
        expect(list.class  ).to eq( Zenkitlist )
        expect(list.title  ).to eq( title )
      end

      it 'handles tasks' do
        expect(Zenkittask).to receive(:handle_tasks).exactly(1).time.and_return(true)
        Zenkitlist.create_from folder, title, []
      end
    end
  end
end
