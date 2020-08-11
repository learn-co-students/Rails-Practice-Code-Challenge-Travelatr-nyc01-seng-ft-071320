class PostsController < ApplicationController
  before_action :find_post, only: [:like, :show, :edit, :update]

  def new
    @post = Post.new
  end

  def like
    @post.increment!(:likes)

    redirect_to post_path(@post)
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end
  
  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
