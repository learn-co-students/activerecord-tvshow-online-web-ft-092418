class Show < ActiveRecord::Base 
  
  
  def self.highest_rating
    Show.order(rating: :desc).first.rating
  end
  
  def self.most_popular_show
    Show.where(self.highest_rating == :rating).take
  end
  
  def self.lowest_rating
     Show.order(:rating).first.rating
  end
  
  def self.least_popular_show
    show = Show.where(rating: self.lowest_rating).take!
  end
  
  def self.ratings_sum 
    Show.sum(:rating)
  end
  
  def self.popular_shows
    Show.where("rating > 5")
  end
  
  def self.shows_by_alphabetical_order
    Show.order(:name)
  end
end