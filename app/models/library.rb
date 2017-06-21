class Library < ActiveRecord::Base

  # Relationships
  has_many :reviews

  belongs_to :language
  belongs_to :framework
  belongs_to :user

  # nice alias to make the rest of the code clearer
  def created_by=(user)
    self.user = user
  end
  
  def created_by
    self.user
  end
  
end
