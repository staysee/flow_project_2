class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #redirect to signed in
      flash[:sucess] = 'Welcome to Flow Finder!'
      redirect_to user_path

    else
      flash[:error] = 'Registration Fail: Please make sure all fields are entered correctly.'

      redirect_to new_user_path
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

end
