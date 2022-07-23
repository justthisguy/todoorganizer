FactoryBot.define do
  ###
  ## => Shared sequence
  ###
  sequence(:title) {|n| "The #{n.ordinalize} Glorious Empire of Cassiopeia Seven"}
  sequence(:line1) {|n| "#{n} Harrison Street"}
  sequence(:line2) {|n| "Apt #{n}"}
  sequence(:locality) {|n| "#{n.ordinalize} Circle of Hezmana"}
  sequence(:company) {|n| "The #{n} FishShaped Dren Company"}
  sequence(:email) {|n| "B#{n}ob@fish.dren"}
  sequence(:first_name) {|n| "Bo#{n}b"}
  sequence(:last_name) {|n| "Johnson#{n}"}
  sequence(:number) {|n| "#{n}"}
  sequence(:postal_usa) {|n| "#{n.to_s.rjust(5, '0')}"}
  sequence(:url) {|n| "http://feed.smartnumber#{n}.com/this_is_important_informtion#{n}/"}
  sequence(:uid) {|n| "#{n.to_s.rjust(10, '0')}"}
end