class PostsController < ApplicationController
  def home
  end

  def index
    @posts = Post.all
  end

  def new
  end

  def edit
  end
end
