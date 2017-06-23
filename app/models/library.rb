class Library < ActiveRecord::Base
  include Averagable
  include Recentable

  # Relationships
  has_many :reviews

  belongs_to :language
  belongs_to :framework
  belongs_to :created_by, :class_name => "User"

  # scope
  scope :most_popular, -> { joins(:reviews).group("libraries.id").order('COUNT("reviews.id") DESC').distinct }

  # Validations
  validates :name, presence: true
  validates :documentation_url, http_url: true
  validates :library_url, http_url: true

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
