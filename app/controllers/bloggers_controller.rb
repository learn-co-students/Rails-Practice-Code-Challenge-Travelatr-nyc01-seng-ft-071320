class BloggersController < ApplicationController
    before_action :find_blogger, only: [:show, :edit, :update, :destroy]

    def index
        @bloggers = Blogger.all
    end

    def show

    end

    def new
        @blogger = Blogger.new
        @blogger.posts.build
    end

    def create
        @blogger = Blogger.new(bloggers_params)
        if @blogger.valid?
            @blogger.save
            redirect_to blogger_path(@blogger) 
        else 
            flash[:my_errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path 
        end
        
    end

    def destroy
        @blogger.destroy 
    end

    private

    def bloggers_params
        params.require(:blogger).permit(:name, :bio, :age, posts_attributes: [
            :title,
            :content,
            :likes,
            :destination_id
        ])     
    end

    def find_blogger
        @blogger = Blogger.find(params[:id])
    end
        
end