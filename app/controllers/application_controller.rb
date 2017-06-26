class ApplicationController < ActionController::Base
  # allow site wide authenetication
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def homepage
    @top_frameworks = Framework.most_popular.limit(3)
    @top_languages = Language.most_popular.limit(3)
    @top_libraries = Library.most_popular.limit(3)
  end

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to preform this action"
    redirect_to(request.referrer || root_path )
  end
  
end
