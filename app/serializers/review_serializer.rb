class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :user_name, :updated_at
  include LibrariesHelper # get the format_comment_time methoud into the serializer

  # functions allow you to return coustom and even override data
  def user_name
    return object.user.display_name
  end

  def updated_at
    return format_comment_time(object.updated_at)
  end

end
