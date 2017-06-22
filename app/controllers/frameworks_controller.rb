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

    def create
        @framework = Framework.new(post_params)
        @framework.save ? redirect_to(framework_path(@framework)) : render(:new)
    end
    
    def update
        @framework.update(post_params)
        @framework.valid? ? redirect_to(framework_path(@framework)) : render(:edit)
    end
    
    def destroy
        @framework.destroy
        redirect_to frameworks_path
    end
    

    private 
    def load_framework
        @framework = Framework.find(params[:id])
    end

    def post_params
        params.require(:framework).permit(:name, :descripton)
    end
    
end
