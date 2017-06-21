class Framework < ActiveRecord::Base
    has_many :libraries
    has_many :languages, through: :libraries
    has_many :reviews, through: :libraries

    scope :most_popular, -> { joins(libraries: [:reviews]).group("frameworks.id").order('count("reviews.id") DESC').distinct }
    scope :by_language, -> language { joins(libraries: [:language]).where("libraries.language_id": language).distinct }

    def average_rating
        self.reviews.average(:rating)
    end
    
end
