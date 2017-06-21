class Language < ActiveRecord::Base
    has_many :libraries
    has_many :frameworks, through: :libraries
end
