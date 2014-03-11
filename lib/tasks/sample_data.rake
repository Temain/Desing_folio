namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@mail.ru",
                 role_id: 1,
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@mail.ru"
      password = "password"
      User.create!(name: name,
                   email: email,
                   role_id: 1,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all().limit(6)
    50.times do
      content = Faker::Lorem.sentence(5)
      title = "Title"
      from = Time.now.to_f
      to = 2.years.from_now.to_f
      created_at = Time.at(from + rand * (to - from))
      users.each { |user| user.microposts.create!(content: content, title: title, created_at: created_at) }
    end
  end
end