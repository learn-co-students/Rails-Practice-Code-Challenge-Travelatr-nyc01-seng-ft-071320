class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { maximum: 30 }

    def total_likes
        posts.inject(0) { |sum, post| sum + post.likes }
    end
end
