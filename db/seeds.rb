# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

game = Game.create!(title: "Apex Legends", release_date: "02.04.2019", description: "Apex Legends is a free-to-play hero shooter game developed by Respawn Entertainment and published by Electronic Arts.")

game = Game.create!(title: "Fortnite", release_date: "07.25.2017", description: "Fortnite is a survival game where 100 players fight against each other in player versus player combat to be the last one standing.")

game = Game.create!(title: "Valorant", release_date: "06.02.2020", description: "Valorant is a team-based first-person hero shooter set in the near future.")
