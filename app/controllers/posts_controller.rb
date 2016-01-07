class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = 'Posted!'
      redirect_to user_path(current_user)
    else
      flash.now[:error] = 'Error. Not posted. Try again.'
      redirect_to :back
    end
  end

  def destroy
    @post.destroy
    redirect_to :back
  end


private

  def post_params
    params.require(:post).permit(:body, :image_url)
  end

  #Confirms the correct user
  def correct_user
    @post = current_user.posts.find(params[:id])
  end


end
