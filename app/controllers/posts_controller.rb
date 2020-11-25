class PostsController < ApplicationController
  def home
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:content))
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  @post = Post.find(params[:id])
  if @post.update(params.require(:post).permit(:content))
    redirect_to posts_path
  else
    render 'edit'
  end
  
end




end
