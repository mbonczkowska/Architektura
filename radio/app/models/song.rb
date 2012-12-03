# -*- coding: utf-8 -*-
class Song < ActiveRecord::Base

  attr_accessible :album, :author, :length, :length_min, :title, :year, :tag_list,
     :cover, :remove_cover, :cover_cache, :remote_cover_url, :text_search 
  acts_as_taggable_on :tags
  has_attached_file :cover

def length_min
 t = Time.at(length).utc.strftime("%H:%M:%S") #=> "01:00:00"
return t
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
