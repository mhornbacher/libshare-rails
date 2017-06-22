class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :library

  # validates that the rating exists and is between 1 and 5
  validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5}
end
