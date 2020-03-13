# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Create genres'

Genre.create([
  { name: 'Rock' }, { name: 'MPB' }, { name: 'Reggae' }, { name: 'Sertanejo Universitário' }, { name: 'Punk '},
  { name: 'Pop' }, { name: 'Eletronica' }
])

puts 'Creating Artists'

Artist.create([
  {genre: [0, 1].sample, name: Faker::Music::RockBand.name},
  {genre: [0, 1].sample, name: Faker::Music::RockBand.name},
  {genre: [0, 1].sample, name: Faker::Music::RockBand.name},
  {genre: [0, 1].sample, name: Faker::Music::RockBand.name},
  {genre: [0, 1].sample, name: Faker::Music::RockBand.name},
  {genre: [0, 1].sample, name: Faker::Music::RockBand.name},
  {genre: [0, 1].sample, name: Faker::Music::RockBand.name},
  {genre: [0, 1].sample, name: Faker::Music::RockBand.name},
  {genre: [0, 1].sample, name: Faker::Music::RockBand.name},
  {genre: [0, 1].sample, name: Faker::Music::RockBand.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name},
  {genre: [0, 1].sample, name: Faker::Name.name}
])

puts 'Creating Events'

15.times do |i|
  event = Event.create(
    date: DateTime.now + ([0, 1, 2].sample).days,
    event_type: [0, 1].sample,
    name: Faker::Games::LeagueOfLegends.masteries,
    private: [true, false].sample
  )

  if event.festival?
    line_up = LineUp.create(event: event, name: Faker::Games::Pokemon.move)
    line_up.artists.push(Artist.all.sample([2, 3, 4].sample))
    event.genres.push(Genre.all.sample([2, 3, 4].sample))
  else
    line_up = LineUp.create(event: event, name: 'Solo')
    line_up.artists.push(Artist.all.sample)
    event.genres.push(Genre.all.sample)
  end
end
