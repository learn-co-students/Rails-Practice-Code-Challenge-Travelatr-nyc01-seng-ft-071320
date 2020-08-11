class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_five_posts
        posts.order("created_at DESC").limit(5)
    end

    def most_liked_post
        posts.order("likes DESC").first
    end

    def unique_bloggers
        bloggers.uniq
    end

    def average_blogger_age
        unique_bloggers.inject(0){ |sum, blogger| sum + blogger.age } / unique_bloggers.count.to_f
    end
end
