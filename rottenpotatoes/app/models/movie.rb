class Movie < ActiveRecord::Base
  def others_by_same_director
    Movie.where(director: self.director).where.not(id: self.id)
  end
  
  def self.with_director(director)
    where(director: director)
  end
end
