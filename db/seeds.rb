# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
emails = %w[foo@coldmail.com bar@coldmail.com binz@coldmail.com]
password = "tuna123"
locations = ["center town hall", "benny's backyard", "lakeside garden"]

emails.each do |email|
  User.create email: email, password: password, password_confirmation: password
end

locations.each_with_index do |location, index|
  Event.create date: Date.today, location: location, creator_id: index
end
