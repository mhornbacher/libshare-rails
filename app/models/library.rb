class Library < ActiveRecord::Base

  # Relationships
  has_many :reviews

  belongs_to :language
  belongs_to :framework
  belongs_to :created_by, :class_name => "User"
  
end
