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

  end

  def destroy
  end


end
