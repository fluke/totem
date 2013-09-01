class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def check_group_admin?
    if @group.creator == current_user
      return true
    else
      return false
    end
  end
  
  helper_method :check_group_admin?
end
