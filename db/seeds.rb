# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times {
  user = User.create(
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    bio: Faker::Quote.famous_last_words,
    birthdate: Faker::Date.between(from: '1985-01-01', to: '2000-12-12'),
    location: Faker::Address.state,
    name: Faker::FunnyName.name
  )

  user_posts = rand(5..10)
  user_posts.times { 
    user.posts.build(
      :content => Faker::Lorem.sentence,
      :user_id => user.id
    )
  }
  
  user.save
}

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..1010]
  followers      = users[3..900]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end