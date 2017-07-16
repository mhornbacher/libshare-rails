class ReviewsController < ApplicationController
    before_action :load_review
    before_action :authenticate_user!, :except => [:index]
    
    def create
        @review = Review.new(post_params)
        @review.library = @library if @library
        @review.user = current_user
        if !@review.save
            render json: {error_code: "400", message: "Invalid paramaters"}
        end
        respond_to do |format|
            format.html {redirect_to(library_path(@library))}
            format.json {render "create.json"} # idk if the render is needed. TODO remove and find out
        end
    end
    
    def destroy
        @review.destroy
        @library ? redirect_to(library_path(@library)) : redirect_to(root_path)
    end

    def index
        @reviews = @library.reviews.all
        respond_to do |format|
            format.html
            format.json {render json: @reviews}
        end
    end
    
    def new
        @review = @library.reviews.build
    end

    private
    def load_review
        @review = Review.find(params[:id]) if params[:id]
        @library = Library.find(params[:library_id]) if params[:library_id]
    end

    def post_params
        params.require(:review).permit(:rating, :comment)
    end
    
end
