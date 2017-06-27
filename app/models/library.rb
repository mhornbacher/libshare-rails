class Library < ActiveRecord::Base
  include Averagable
  include Recentable
  
  # Relationships
  has_many :reviews

  belongs_to :language
  belongs_to :framework
  belongs_to :created_by, :class_name => "User"

  # scope
  scope :most_popular, -> { select('libraries.*, COUNT("reviews"."id")').joins(:reviews).group("libraries.id").order('COUNT("reviews"."id") DESC').distinct }

  # Validations
  validates :name, presence: true
  validates :documentation_url, http_url: true
  validates :library_url, http_url: true

  validates :language, presence: true
  validates :framework, presence: true

  # review attributes
  def reviews_attributes=(review_attributes)
    review_attributes.each do |review_attribute|
      review = Review.first_or_create(review_attribute)
      self.reviews << review
    end
  end

  def comments
    self.reviews.where.not(comment: nil).where.not(comment: "")
  end

  def vote_count
    self.reviews.count
  end
  
  def comment_count
    self.comments.count
  end
  
end
