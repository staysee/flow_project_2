class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    if User.new(user_params).save
      #redirect to signed in
      flash[:sucess] = 'Welcome to Flow Finder!'
      redirect_to users_path
    else
      flash[:error] = 'Registration Fail: Please make sure all fields are entered correctly.'

      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end




private
  def user_params
    params.require(:user).permit(:name, :handle, :email, :password, :password_confirmation)
  end

end
