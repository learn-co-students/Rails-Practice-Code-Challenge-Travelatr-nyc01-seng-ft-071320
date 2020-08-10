class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: {minimum: 1, maximum: 120}
    validates :bio, length: {minimum: 31}


    def like_count
        total_likes = 0
        self.posts.each do |post|
            total_likes += post.likes 
        end
        total_likes 
    end

    def most_liked_post
        self.posts.max_by {|post| post.likes}
    end

    def posts_attributes=(posts_attributes)
        posts_attributes.values.each do |post_attributes|
            self.posts.build(post_attributes)
        end
    end
end
