5.times do
	user = User.new
	user.email = Faker::Internet.email
	user.password = "password"
	user.password_confirmation = "password"
	user.encrypted_password = Faker::Internet.password(8)
	user.save! 	
end

User.all.each do |u|
	5.times do
		u.items.create!(
			name: Faker::StarWars.quote
			)
	end
end