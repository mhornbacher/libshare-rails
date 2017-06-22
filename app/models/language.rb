class Language < ActiveRecord::Base
    has_many :libraries
    has_many :frameworks, through: :libraries
    has_many :reviews, through: :libraries 
    # if I add a review count column I can use , counter_cache: true with order('reviews_count DESC') to inprove performance here and on frameworks (less compleax query in exchange for some writes)

    scope :most_popular, -> { joins(libraries: [:reviews]).group("languages.id").order('COUNT("reviews.id") DESC').distinct }
    scope :by_framework, -> framework {joins(libraries: [:reviews]).where("libraries.framework_id": framework).distinct }

    def average_rating
        self.reviews.average(:rating)
    end
end
