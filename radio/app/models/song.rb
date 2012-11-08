class Song < ActiveRecord::Base

  attr_accessible :album, :author, :length, :title, :year, :tag_list,
     :cover, :remove_cover, :cover_cache, :remote_cover_url 
  acts_as_taggable_on :tags
end
def self.text_search(query)
  if query.present?
    # SQLite
    where('quotation like ?', "%#{query}%")
    # PostgreSQL; i . ignore case
    # where("quotation ilike :q or source ilike :q", q: "%#{query}%")
  else
    scoped
  end
end
