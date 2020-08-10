class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def most_written_about_destinations
        self.destinations.uniq.max_by(5){|destination| destination.posts.count }
    end

end
