class Song < ActiveRecord::Base

  attr_accessible :album, :author, :length,:length_min, :title, :year, :tag_list,
     :cover, :remove_cover, :cover_cache, :remote_cover_url,:text_search 
  acts_as_taggable_on :tags


def length_min
Time.at(length).utc.strftime("%H:%M:%S")

end

def self.search(search)
  if search
    find(:all, :conditions => ['Album like ?', "%#{search}%"])
  else
    find(:all)
  end
end
 def crop_cover
    cover.recreate_versions! if crop_x.present?
  end
end
