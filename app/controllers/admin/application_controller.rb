class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    respond_to do |format|
      format.html { redirect_to admin_articles_path }
      format.js { redirect_to admin_unauthorized_path }
    end
  end
end
