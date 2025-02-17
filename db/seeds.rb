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

DND_DRAFT_TEMPLATE = {
  abilities: [
    { name: 'Strength', default: 10, mod_formula: 'floor((value - 10) / 2)' },
    { name: 'Dexterity', default: 10, mod_formula: 'floor((value - 10) / 2)' },
    { name: 'Constitution', default: 10, mod_formula: 'floor((value - 10) / 2)' },
    { name: 'Intelligence', default: 10, mod_formula: 'floor((value - 10) / 2)' },
    { name: 'Wisdom', default: 10, mod_formula: 'floor((value - 10) / 2)' },
    { name: 'Charisma', default: 10, mod_formula: 'floor((value - 10) / 2)' }
  ],
  skills: [
    { name: 'Acrobatics', ability: 'Dexterity' },
    { name: 'Animal Handling', ability: 'Wisdom' },
    { name: 'Arcana', ability: 'Intelligence' },
    { name: 'Athletics', ability: 'Strength' },
    { name: 'Deception', ability: 'Charisma' },
    { name: 'History', ability: 'Intelligence' },
    { name: 'Insight', ability: 'Wisdom' },
    { name: 'Intimidation', ability: 'Charisma' },
    { name: 'Investigation', ability: 'Intelligence' },
    { name: 'Medicine', ability: 'Wisdom' },
    { name: 'Nature', ability: 'Intelligence' },
    { name: 'Perception', ability: 'Wisdom' },
    { name: 'Performance', ability: 'Charisma' },
    { name: 'Persuasion', ability: 'Charisma' },
    { name: 'Religion', ability: 'Intelligence' },
    { name: 'Sleight of Hand', ability: 'Dexterity' },
    { name: 'Stealth', ability: 'Dexterity' },
    { name: 'Survival', ability: 'Wisdom' }
  ]
}

Adventure.destroy_all
["Grande Oceano", "Qantara", "Seekers S3"].each do |name|
  Adventure.create!(name: name, gamemaster: Player.first, data: DND_DRAFT_TEMPLATE)
end
