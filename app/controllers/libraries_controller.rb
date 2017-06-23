class LibrariesController < ApplicationController
    def index
        @libraries = Library.most_recent
    end
    
end
