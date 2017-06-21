class Library < ActiveRecord::Base
  belongs_to :language
  belongs_to :framework
  belongs_to :user

  def created_by=(user)
    self.user = user
  end
  
  def created_by
    self.user
  end
  
end
