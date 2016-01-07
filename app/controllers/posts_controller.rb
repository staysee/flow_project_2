class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

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
  end


private

  def post_params
    params.require(:post).permit(:body, :image_url)
  end


end
