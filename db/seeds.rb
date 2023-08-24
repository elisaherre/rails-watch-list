# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

url = "http://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)["results"]

index = 0
puts 'creating movies'

20.times do
  movie = Movie.new(
    title: movies[index]["title"],
    overview: movies[index]["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movies[index]["poster_path"]}",
    rating: movies[index]["vote_average"]
)
  movie.save
  index += 1
end
puts 'movies iteration complete'
