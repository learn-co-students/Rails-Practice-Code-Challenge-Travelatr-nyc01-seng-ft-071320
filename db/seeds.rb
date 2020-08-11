p Destination.destroy_all
p Blogger.destroy_all
p Post.destroy_all
puts "start"
10.times do
Destination.create({
name: Faker::Address.city,
country: Faker::Address.country
})
end
5.times do
blogger = Blogger.create({
name: Faker::Name.unique.name,
bio: Faker::Hipster.paragraph,
age: (13..100).to_a.sample
})
end
60.times do
num=rand(50..100)
Post.create(title: Faker::Address.community, content: Faker::Hipster.paragraph, likes: num, blogger_id: Blogger.all.sample.id, destination_id: Destination.all.sample.id)
end
p Destination.count
p Blogger.count
p Post.count
puts "done"
