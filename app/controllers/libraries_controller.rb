class LibrariesController < ApplicationController
    before_action :load_library, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, :except => [:show, :index]
    
    def index
        @libraries = Library.most_recent
    end

    def most_popular
        @libraries =  Library.most_popular
        @most_popular = true
        render(:index)
    end

    def show
        @comment = @library.reviews.build
    end

    def new
        @library = Library.new
        authorize @library
        @review = @library.reviews.build
    end
    
    def edit
    end

    def create
        binding.pry
    end
    
    
    private
    def load_library
        @library = Library.find(params[:id])
        authorize @library
    end
    
end
