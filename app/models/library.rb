class Library < ActiveRecord::Base
  include Averagable

  # Relationships
  has_many :reviews

  belongs_to :language
  belongs_to :framework
  belongs_to :created_by, :class_name => "User"

  def comments
    self.reviews.where.not(comment: nil).where.not(comment: "")
  end
end
