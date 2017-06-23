class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def homepage
    @top_frameworks = Framework.most_popular.limit(3)
    @top_languages = Language.most_popular.limit(3)
    @top_libraries = Library.most_popular.limit(3)
  end
  
end
