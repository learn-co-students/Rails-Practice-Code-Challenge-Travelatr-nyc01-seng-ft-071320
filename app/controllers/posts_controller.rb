class PostsController < ApplicationController
  before_action :find_post, except: [:new, :create]

  def show; end

  def new
      @post = Post.new
  end

  def create
      @post = Post.create(post_params)
      if @post.valid?
          redirect_to post_path(@post)
      else
          flash[:my_errors] = @post.errors.full_messages
          render :new
      end
  end

  def edit; end

  def update
      @post.update(post_params)
      if @post.valid?
          redirect_to post_path(@post)
      else
          flash[:my_errors] = @post.errors.full_messages
          render :edit
      end
  end
  
  def like
      @post.increment!(:likes)
      redirect_to post_path(@post)
  end
  
  private
  
  def post_params
      params.require(:post).permit(:title, :blogger_id, :destination_id, :content, :likes)
  end
  
  def find_post
      @post = Post.find(params[:id])
  end

end