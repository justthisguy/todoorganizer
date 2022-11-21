require 'yaml'

class WunderlistCommands
  def self.setup
    Wunderfolder.create title: 'null' # all lists need a folder
    file   = File.open( "../wundertasks.json" )
    wunder = Psych.safe_load( file, symbolize_names: true )

    wunder.each do |list_hash|
      Wunderlist.create_from_hash list_hash
    end
  end

  def self.delete_all # needs to be done in reverse order of dependancy
    Wundersubtask.delete_all ; puts Wundersubtask.count
    Wundertask.delete_all    ; puts Wundertask.count
    Wunderlist.delete_all    ; puts Wunderlist.count
    Wunderfolder.delete_all  ; puts Wunderfolder.count
  end
end
