class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def last_five_posts
        self.posts.last(5)
    end

    def most_liked_post
        self.posts.max_by{|post| post.likes}
    end

    def average_blogger_age
        (self.bloggers.uniq.sum{|blogger| blogger.age}) / self.bloggers.uniq.count
    end

    
end
