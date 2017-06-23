class LibrariesController < ApplicationController
    before_action :load_library, only: [:show, :edit, :update, :destroy]
    
    def index
        @libraries = Library.most_recent
    end

    def most_popular
        raise Library.most_popular.pluck(:name).inspect
    end

    def show
    end

    def new
    end
    
    def edit
    end
    
    private
    def load_library
        @library = Library.find(params[:id])
    end
    
end
