class Song < ActiveRecord::Base


  attr_accessible :album, :author, :length, :title, :year
#  acts_as_taggable_on :tags
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
