class DestinationsController < ApplicationController

    def show
        @destination = Destination.find(params[:id])
        @recent_five_posts = @destination.posts.order("created_at DESC").limit(5)
        @most_liked_post = @destination.posts.order("likes DESC").first
        @average_blogger_age = @destination.bloggers.average(:age).round(2)
    end
end
