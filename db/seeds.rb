# Create admin user.
User.create!(name:  "Matz",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

# Generate a bunch of additional users.
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(5)
50.times do
  users.each_with_index do |user, index|
    content = case index
      when 0 then Faker::Quote.matz
      when 1 then Faker::Quote.yoda
      when 2 then Faker::Quote.most_interesting_man_in_the_world
      when 3 then Faker::Quote.famous_last_words
      when 4 then Faker::Quote.singular_siegler
      else ''
    end
    user.microposts.create!(content: content[0...500])
  end
end

# Create following relationships.
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
