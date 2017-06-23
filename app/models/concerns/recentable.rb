module Recentable
    extend ActiveSupport::Concern

    included do
        scope :most_recent, -> { order('updated_at DESC') }
        scope :oldest, -> { order('updated_at ASC') }
    end
    
end