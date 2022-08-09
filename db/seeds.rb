# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  book = Book.new(
    title: Faker::Book.title,
    author: Faker::Book.author,
    published_year: rand(1980..2022),
    genre: Faker::Book.genre,
    stock: rand(1..5)
  )
  book.save!
end
