class ReviewsController < ApplicationController
    before_action :load_review
    
    def create
        review = Review.new(post_params)
        review.library = @library if @library
        review.user = current_user
        if !review.save
            binding.pry
        end
        redirect_to(library_path(@library))
    end
    
    def destroy
        @review.destroy
        @library ? redirect_to(library_path(@library)) : redirect_to(root_path)
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
