class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts 

    def recent_posts
        posts = []
        Post.all.each do |p|
            if p.destination_id == self.destination_id
                posts << p
            end
        end
        posts
    end
end
