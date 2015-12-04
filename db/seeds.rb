user = User.new
user.email = "jason@example.com"
user.password = "123456"
user.password_confirmation = "123456"
user.user_name = "test"
user.skip_confirmation!
user.save!

10.times {Item.create!(user: user, name: Faker::Lorem.sentence )}
5.times {Item.create!(user: user, name: Faker::Lorem.sentence, state: :completed)}
3.times {Item.create!(user: user, name: Faker::Lorem.sentence, state: :archived)}
puts "seeded user jason@example.com"