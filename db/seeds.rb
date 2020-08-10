# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Destination.destroy_all
Blogger.destroy_all
Post.destroy_all

30.times do 
  num=rand(10000..20000)
  num1=rand(20000..30000)
  Destination.create({
    name: "name#{num}",
    country: "name#{num1}"
  })
end

10.times do
  num=rand(18..67)
  num2=rand(10000..20000)
  num1=rand(20000..30000)
  blogger = Blogger.create({
    name: "nameasdfdsfji#{num1}",
    bio: "biopioewsafksdj#{num2}ssssssfsafdsfdsafdsaifhdsdsfadskjfnadsfadsfjdsafsdafdsfsdfds",
    age: num
  })
end

  50.times do 
    num=rand(1..1000)
    num2=rand(10000..20000)
    num1=rand(20000..30000)
    Post.create({title: "title#{num2}",
      content: "content#{num1}sssskkkkasfkdsa;lfndasfkdsnafkaew;foiesdafqwertyuioppoiuytrewesadfghjkmnbvcxzcvbfdghwfaewofjoewifwe;aeiwfwe;oifewafajweo;fiwejf",
      likes: num,
      blogger_id: Blogger.all.sample.id,
      destination_id: Destination.all.sample.id
    })
  end

  p Destination.count
  p Blogger.count
  p Post.count