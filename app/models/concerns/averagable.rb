module Averagable
    extend ActiveSupport::Concern

    def average_rating
        self.reviews.average(:rating)
    end
    
end