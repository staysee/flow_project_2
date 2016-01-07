class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user

protected
  #this is where we create a method that returns a logged in user.
  #This method will at first attempt to return the current user,
  #this is the @user part. The || says: OR if the @user doesn't exist, assign the result of User.find...
  #to @user, BUT, only attempt the User.find if there is a :user_id stored in the session.

  # def current_user
  #   @current_user ||= User.find session[:user_id] if session[:user_id]
  # end

  # def authorize
  #   unless current_user
  #     flash[:error] = "you must sign in first to go to that page"
  #     redirect_to new_session_path
  #   end
  # end


  #Confirms a logged-in user
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to new_session_path
    end
  end

end
