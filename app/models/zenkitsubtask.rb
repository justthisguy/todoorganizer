class Zenkitsubtask < ApplicationRecord
  belongs_to :zenkittask

  def from_string string
    done_str = string[0,5]
    title    = string[5,999].strip
    # puts "from string done_str <#{done_str}> title <#{title}>"

    self.title = hash[:title]
    self.done  = done_str == " [x] "
    self.save!

    self
  end

  def self.handle_checklists task, checklists_string
    return if checklists_string.nil?

    checklists_array = checklists_string.split '-'
    checklists_array.shift # removes "Checklist: "
    checklists_array.each { |string| task.zenkitsubtasks.new.from_string string  }
  end
end


# "Checklist: - [x] Redirect given all the residence - [x] Percent residents became homeless - [ ] Blocking the box in intersections - [ ] Dedicated right and left hand lanes - [ ] Alexis Ward parks and rec - [ ] Mailing list manager/ advocate app - [ ] Courtney is point person - [ ] Jeff Handy - [ ] Tide house laws"

#  [ ] 2 eggs - [x] dried mushrooms soaked in broth
