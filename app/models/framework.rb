class Framework < ActiveRecord::Base
    include Averagable
    include Recentable

    has_many :libraries
    has_many :languages, through: :libraries
    has_many :reviews, through: :libraries

    scope :most_popular, -> { joins(libraries: [:reviews]).group("frameworks.id").order('count("reviews"."id") DESC').distinct }
    scope :by_language, -> language { joins(libraries: [:language]).where("libraries.language_id": language).distinct }

    validates :name, presence: true
    
end
