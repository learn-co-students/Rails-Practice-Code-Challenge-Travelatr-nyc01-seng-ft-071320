class BloggersController < ApplicationController

  before_action :find_blog, only: [:show, :edit, :update, :destroy]

  def index
    @bloggers = Blogger.all
  end

  def show
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)
  end

  def edit
  end

  def update
    @blogger.update(blogger_params)
    redirect_to blogger_path(@blogger)
  end

  def destroy
    @blogger.destroy
    redirect_to blogs_path(@bloggers)
  end

  private

  def find_blog
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end

end
