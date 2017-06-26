class LanguagesController < ApplicationController
    before_action :load_language, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, :except => [:show, :index]

    def index
        @languages = Language.order('updated_at DESC')
    end

    def show
    end

    def new
        @language = Language.new
    end
    
    def edit
    end

    def create
        @language = Language.new(post_params)
        @language.save ? redirect_to(language_path(@language)) : render(:new)
    end
    
    def update
        @language.update(post_params)
        @language.valid? ? redirect_to(language_path(@language)) : render(:edit)
    end
    
    def destroy
        @language.destroy
        redirect_to languages_path
    end
    
    private 
    def load_language
        @language = Language.find(params[:id])
        authorize @language
    end

    def post_params
        params.require(:language).permit(:name, :description)
    end
    
end
