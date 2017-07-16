module Pageable
    extend ActiveSupport::Concern

    def next
        @next ||= self.class.where("id > ?", id).first
    end

    def previous
        @previous ||= self.class.where("id < ?", id).last
    end
    
end