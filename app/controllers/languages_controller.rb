class LanguagesController < ApplicationController

    before_action :load_languages, only: [:show, :edit, :update, :destroy]

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
    def load_languages
        @language = Language.find(params[:id])
    end

    def post_params
        params.require(:language).permit(:name, :description)
    end
    
end
