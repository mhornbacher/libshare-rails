class Framework < ActiveRecord::Base
    has_many :libraries
    has_many :languages, through: :libraries
end
