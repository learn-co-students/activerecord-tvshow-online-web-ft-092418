class Show < ActiveRecord::Base
    def self.highest_rating
        Show.maximum(:rating)
    end

    def self.most_popular_show
        hiRate = self.highest_rating
        self.find_by rating: "#{self.highest_rating}".to_i
    end

    def self.lowest_rating
        Show.minimum(:rating)
    end

    def self.least_popular_show
        loRate = self.highest_rating
        self.find_by rating: "#{self.lowest_rating}".to_i
    end

    def self.ratings_sum
        self.sum(:rating)
    end

    def self.popular_shows
        self.where("rating > 5")
    end

    def self.shows_by_alphabetical_order
        self.all.order("name ASC")
    end
end