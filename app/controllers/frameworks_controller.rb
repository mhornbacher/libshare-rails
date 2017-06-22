class FrameworksController < ApplicationController
    before_action :load_framework, only: [:show, :edit, :update, :destroy]

    def index
        @frameworks = Framework.all
    end

    def show
    end

    def new
        @framework = Framework.new
    end
    
    def edit
    end
    

    private 
    def load_framework
        @framework = Framework.find(params[:id])
    end
    
end
