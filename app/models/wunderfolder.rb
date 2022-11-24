class Wunderfolder < ApplicationRecord
  has_many :wunderlists

  def from_hash source
    self.title = source[:title]
    self.directory_path = source[:directoryPath]
    self.createdAt = DateTime.parse source[:createdAt]
    self.updatedAt = DateTime.parse source[:updatedAt]
    self.save!
    self
  end


  ###
  # a quirk of the Wunderlist file format is that lists actually have
  # references to their folder if they are in a folder. Everything else
  # is contained as array of the containing object.
  ###
  def self.find_or_create source
    return Wunderfolder.where( title: 'null' ).first if source.nil?

    folder = Wunderfolder.where( title: source[:title] ).first
    if folder.nil?
      folder =  Wunderfolder.new
      folder.from_hash source
    end
    folder
  end
end

# hf1 = {"title": "TODO", "directoryPath": "TODO", "createdAt": "2016-12-19T18:15:51.952Z", "updatedAt": "2019-08-18T03:48:55.746Z"}
# hf2 = {"title": "test3", "directoryPath": "test3", "createdAt": "2016-12-19T18:15:51.952Z", "updatedAt": "2019-08-18T03:48:55.746Z"}
