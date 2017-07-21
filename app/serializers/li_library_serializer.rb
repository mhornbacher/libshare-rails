class LiLibrarySerializer < ActiveModel::Serializer
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::NumberHelper
  attributes :id, :name, :path, :average_rating, :description

  def path
    return "#{object.class.name.downcase}s/#{object.id}"
  end

  def average_rating
    return number_to_human(object.average_rating)
  end

  def description
    if object.description
      truncate(object.description, :length => 50, :separator => ' ')
    else
      return "No description available"
    end
  end

end
