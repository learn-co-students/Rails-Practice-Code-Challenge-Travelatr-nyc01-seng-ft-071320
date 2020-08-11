class BloggersController < ApplicationController

  def show
      @blogger = Blogger.find(params[:id])
  end

  def new
      @blogger = Blogger.new
  end

  def create
      @blogger = Blogger.create(blogger_params)
      if @blogger.valid?
          redirect_to blogger_path(@blogger)
      else
          flash[:my_errors] = @blogger.errors.full_messages
          render :new
      end
  end

  private

  def blogger_params
      params.require(:blogger).permit(:name, :bio, :age)
  end
end