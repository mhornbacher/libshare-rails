class Library < ActiveRecord::Base
  belongs_to :language
  belongs_to :framework
end
