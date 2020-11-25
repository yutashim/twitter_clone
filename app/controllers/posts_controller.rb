class PostsController < ApplicationController
  def home
  end

  def index
    @posts = Post.all
  end

  def show
    redirect_to posts_path
  end

  def new
    if params.has_key?('post')
      @post = Post.new(posts_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    set_post
  end

  def update
    set_post
    if @post.update(posts_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    set_post
    @post.destroy
  redirect_to posts_path
  end

  def confirm
    @post = Post.new(params.require(:post).permit(:content))
    render 'new' if @post.invalid?
  end

  private
    def posts_params
      params.require(:post).permit(:content)
    end
    def set_post
      @post = Post.find(params[:id])
    end
end
