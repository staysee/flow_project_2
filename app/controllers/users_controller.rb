class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    # @users = User.all
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #auto sign in
      log_in @user
      flash[:success] = 'Welcome to Flow Finder!'
      redirect_to root_path
    else
      # flash[:error] = 'Registration Fail: Please make sure all fields are entered correctly.'
      # redirect_to new_user_path
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end



private
  def user_params
    params.require(:user).permit(:name, :handle, :email, :password, :password_confirmation)
  end

  #Confirms a logged-in user
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to new_session_path
    end
  end

  #Confirms the correct user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
