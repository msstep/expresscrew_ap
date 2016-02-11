class Location < ActiveRecord::Base

  validates_presence_of :name, :description, :danger
  #validates_inclusion_of :danger, in: %w{ low medium high }

end
