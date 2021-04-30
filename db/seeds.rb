# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Artist.destroy_all
Genre.destroy_all
Song.destroy_all

5.times do
    Artist.create(name: Faker::Music.band, bio: "blah blah blah")
end

10.times do
    Genre.create(name: Faker::Music.genre)
end

20.times do
    Song.create(name: Faker::Music.album, artist: Artist.all.sample, genre: Genre.all.sample)
end


