class LibrariesController < ApplicationController
    
    def index
        @libraries = Library.most_recent
    end

    def most_popular
        raise Library.most_popular.pluck(:name).inspect
    end
    
end
