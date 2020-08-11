class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        posts.inject(0) { |sum, post| sum + post.likes }
    end

    def most_liked_post
        posts.max_by { |post| post.likes }
    end

    def five_most_written_destinations
        destinations.group(:id).order('count(*)').limit(5)
    end
end
