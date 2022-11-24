class Zenkittask < ApplicationRecord
  belongs_to :zenkitlist
  has_many :zenkitsubtasks

  def from_hash hash
    self.title           = hash[:title]
    self.stage           = hash[:stage]
    self.due_date        = hash[:due_date]
    self.notes           = hash[:notes]
    self.files           = hash[:files]
    self.assigned_to     = hash[:assigned_to]
    self.created         = DateTime.strptime(hash[:created], '%m/%d/%Y %I:%M %p')
    self.created_by      = hash[:created_by]
    self.last_updated    = DateTime.strptime(hash[:last_updated], '%m/%d/%Y %I:%M %p')
    self.last_updated_by = hash[:last_updated_by]
    self.comments        = hash[:comments]
    self.save!

    Zenkitsubtask.handle_checklists self, hash[:checklists]

    self
  end

  def self.create_from list, hash
    task = list.zenkittasks.new
    task.from_hash hash
    # puts "create_from #{list}, #{hash}"
  end

  def self.handle_tasks list, tasks_array
    puts "Zenkittask#handle_tasks list <#{list}> "
    puts "Zenkittask#handle_tasks tasks_array <#{tasks_array}> "
    tasks_array.each { |hash| Zenkittask.create_from list, hash  }
  end

end


# file_path = '../Zenkit/To Do/backlog.csv'
# s  = SmarterCSV.process(file_path, {:col_sep => ",", :row_sep => "\n"})


# hash = { :title=>"Ask Apple", :stage=>"To-Do", :notes=>"Bring Mac, iPhone and iPad", :created=>"07/18/2020 10:43 AM", :last_updated=>"03/17/2021 8:03 PM", :created_by=>"jtg", :last_updated_by=>"jtg", :checklists=>  "Checklist:\n- [ ] search in mail no longer works still\n- [ ] event: set alerts for 30 minutes before and at the time of but it added 2 hours before. This happened before and I tried everything I could to delete the added alert. finally I deleted the event and recreated it with just the two alerts.\n- [ ] Set background for Pages  to 42% gray and see cursor\n- [ ] Hide all but one contact on one device without changing my iCloud contacts. Then put them back \n- [ ] how do I give access to Contacts without giving access to ALL my contacts. Like not specific location, apps can be limited to only specified photos,   allow access to one group or something like it\n- [ ] My watch is used to unlock my sleeping mac while I am in another room -- I can hear the sound from my watch and see my monitors flash\n- [ ] when I go do bed, I put my MBP to sleep.  when I get up, before I wake it up, it is around 100º F.  Why?\n- [ ] move iTunes info / sync iTunes\n- [ ] ---- \n- [ ] To view emergency medical info should require a picture of the  face of the person viewing for security.\n- [ ] exclude terms from Maps search -- example [ hospital san francisco] shows many pet hospitals [ hospital san francisco -pet ] or [ hospital san francisco NOT pet ] shows only pet hosptials\n- [ ] USB Accessories Disabled unplug the accessory using too much power to re-enable USB devices"}
# hash = { :title=>"Ask Apple", :stage=>"To-Do", :notes=>"Bring Mac, iPhone and iPad", :created=>"07/18/2020 10:43 AM", :last_updated=>"03/17/2021 8:03 PM", :created_by=>"jtg", :last_updated_by=>"jtg"}
# list = FactoryBot.create(:zenkitlist)
# task = list.zenkittasks.new
# task.from_hash hash