class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy,:like]

  def index
    @posts = Post.all
  end

  def show;end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      # byebug
      redirect_to post_path(@post)
    else
      flash[:my_errors]=@post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
    redirect_to post_path(@post)
    else 
      flash[:my_errors]=@post.errors.full_messages
      redirect_to edit_post_path
    end
  end

  def destroy
    @post.destroy
    redirect_to post_path(@posts)
  end

  def like
    @post.likes=@post.likes+1
    # byebug
    @post.save
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes,:blogger_id,:destination_id)
  end

end

