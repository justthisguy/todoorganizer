require 'rails_helper'

RSpec.describe Zenkittask, type: :model do
  it { should belong_to(:zenkitlist) }
  it { should have_many(:zenkitsubtasks) }

  describe 'handle_tasks' do
    context 'always' do
      let(:list) { FactoryBot.create :zenkitlist }
      let(:tasks_array) { [1, 2, 3] }

      it 'calls create_from for each element of the array' do
        expect(Zenkittask).to receive(:create_from).exactly(tasks_array.count).time
        Zenkittask.handle_tasks list, tasks_array
      end
    end
  end

  describe 'create_from' do
    context 'happy path' do
      let(:list) { FactoryBot.create(:zenkitlist) }

      it 'calls from_hash' do
        expect_any_instance_of(Zenkittask).to receive(:from_hash).exactly(1).time.and_return(true)
        Zenkittask.create_from list, {}
      end
    end
  end

  describe 'from_hash' do
    context 'happy path' do
      let(:list) { FactoryBot.create(:zenkitlist) }
      let(:hash) { { :title=>"Ask Apple", :stage=>"To-Do", :notes=>"Bring Mac, iPhone and iPad", :created=>"07/18/2020 10:43 AM", :last_updated=>"03/17/2021 8:03 PM", :created_by=>"jtg", :last_updated_by=>"jtg"} }

      it 'calls Zenkitsubtask#handle_checklists' do
        expect(Zenkitsubtask).to receive(:handle_checklists).exactly(1).time.and_return(true)
        task = list.zenkittasks.new
        task.from_hash hash
      end
    end
  end
end
