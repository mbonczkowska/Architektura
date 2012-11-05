class Song < ActiveRecord::Base
  attr_accessible :album, :author, :length, :title, :year
end
