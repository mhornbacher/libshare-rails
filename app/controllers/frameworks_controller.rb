class FrameworksController < ApplicationController
    def index
        @frameworks = Framework.all
    end
end
