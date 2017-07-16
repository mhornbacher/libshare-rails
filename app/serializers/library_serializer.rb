class LibrarySerializer < ActiveModel::Serializer
  include ActionView::Helpers::TextHelper # for pluralize

  attributes :id, :version, :average_rating, :vote_count, :comment_count, :description, :name
  has_many :reviews, serializer: ReviewSerializer

  def vote_count
    pluralize(object.vote_count, "vote")
  end

  def comment_count
    pluralize(object.comment_count, "comment")
  end

end
