# -*- coding: utf-8 -*-
class Song < ActiveRecord::Base

  attr_accessible :album, :author, :length, :length_min, :title, :year, :tag_list,
     :cover, :remove_cover, :cover_cache, :remote_cover_url,:text_search 
  acts_as_taggable_on :tags

def length_min(length)
  
  m = (length/60).floor
  s = (length - (m * 60)).round
 
  # add leading zero to one-digit minute
  if m < 10
    m = "0#{m}"
  end
  # add leading zero to one-digit second
  if s < 10
    s = "0#{s}"
   end
  # return formatted time
  return "#{m}:#{s}"
 end

def self.search(title)
if title.present?
    # SQLite
  find(:all, :conditions => ['Title like ?', "%#{title}%"])
    # PostgreSQL; i – ignore case
  # where("quotation ilike :q or source ilike :q", q: "%#{query}%")
  else
    scoped
  end
end
 def crop_cover
    cover.recreate_versions! if crop_x.present?
  end
end
