class PostsController < ApplicationController
    def index
        @posts = Post.all            
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post) 
        else 
            flash[:my_errors] = @post.errors.full_messages
            redirect_to new_post_path 
        end

        # @post = Post.new(post_params)

        # if @post.save
        #     redirect_to post_path(@post)
        # else
        #     render :new
        # end

    end

    def edit

    end

    def update

    end

    def destroy

    end

    def like
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save
    
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def find_post

    end
        
end