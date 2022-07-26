class Wunderlist < ApplicationRecord
  belongs_to :wunderfolder
  has_many :wundertasks

  def from_hash source
    self.original_id = source[:id]
    self.title = source[:title]
    self.createdAt = DateTime.parse source[:createdAt]
    self.save

    self.handle_tasks source[:tasks]
    self
  end

  def handle_tasks tasks
    return if tasks.empty? ## this should never happen

    tasks.each do |task_hash|
      task = self.wundertasks.create
      task.from_hash task_hash
    end
  end

  def self.create_from_hash source
    folder = Wunderfolder.find_or_create source[:folder]
    list = folder.wunderlists.new
    list.from_hash source
    list
  end

  def self.setup
    Wunderfolder.create title: 'null' # all lists need a folder
    file   = File.open( "../wundertasks.json" )
    wunder = Psych.safe_load( file, symbolize_names: true )

    wunder.each do |list_hash|
      Wunderlist.create_from_hash list_hash
    end
  end

  def self.deleteall # needs to be done in reverse order of dependancy
    Wundersubtask.delete_all ; puts Wundersubtask.count
    Wundertask.delete_all    ; puts Wundertask.count
    Wunderlist.delete_all    ; puts Wunderlist.count
    Wunderfolder.delete_all  ; puts Wunderfolder.count
  end

end

# { "id": 34496580, "title": "7 Stills", "folder": nil, "tasks": [], "directoryPath": "7 Stills", "textFilePath": "7 Stills/7 Stills.txt", "htmlFilePath": "7 Stills/7 Stills.html", "createdAt": "2012-12-06T04:51:13.98Z" }
