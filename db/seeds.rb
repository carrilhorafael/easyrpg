# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.destroy_all
Player.create!({
  email: 'rafael@email.com',
  name: 'Rafael',
  password: 'Senha123',
  password_confirmation: 'Senha123'
})

puts 'Creating classes'
GameClass.destroy_all
Templates::GameClasses.all.each do |game_class|
  GameClass.create!(game_class)
end

puts 'Creating races'
Race.destroy_all
Templates::Races.all.each do |race|
  Race.create!(race)
end

puts 'Creating feats'
Talent.destroy_all
Templates::Talents.all.each do |talent|
  Talent.create!(talent)
end

puts 'Creating backstories'
Backstory.destroy_all
Templates::Backstories.all.each do |backstory|
  Backstory.create!(backstory)
end
