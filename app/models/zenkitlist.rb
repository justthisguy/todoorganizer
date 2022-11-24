class Zenkitlist < ApplicationRecord
  belongs_to :zenkitfolder
  has_many :zenkittasks

  def self.create_from folder, title, tasks_array
    # list = folder.wunderlists.new
    list = Zenkitlist.find_or_create_by! zenkitfolder: folder, title: title

    Zenkittask.handle_tasks list, tasks_array

    list
  end
end

