# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'


puts 'Clearing old ingredients from database...'
Dose.destroy_all
Ingredient.destroy_all

puts 'Creating new ingredients...'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list = open(url).read
ingredients_hash = JSON.parse(list)
ingredients_array = ingredients_hash['drinks']
(0...ingredients_array.size).to_a.each do |index|
  ingredient_hash = ingredients_array[index]
  ingredient = ingredient_hash['strIngredient1']
  Ingredient.create(name: ingredient)
end

puts 'Finished creating new ingredients. Enjoy!'


puts 'Clearing old cocktails from database...'
Cocktail.destroy_all

puts 'Creating non-alcoholic cocktails...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic'
list = open(url).read
cocktails_hash = JSON.parse(list)
cocktails_array = cocktails_hash['drinks']
(0...cocktails_array.size).to_a.each do |index|
  cocktail_hash = cocktails_array[index]
  cocktail = cocktail_hash['strDrink']
  cocktail_pic = cocktail_hash['strDrinkThumb']
  # uploaded = Cloudinary::Uploader.upload(cocktail_pic)
  url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
  list = open(url).read
  descriptions_hash = JSON.parse(list)
  descriptions_array = descriptions_hash['drinks']
  description_hash = descriptions_array[0]
  description = description_hash['strInstructions']
  @cocktail = Cocktail.new(name: cocktail, description: description)
  @cocktail.remote_picture_url = cocktail_pic
  @cocktail.save
end
puts 'Finished creating non-alcoholic cocktails. Enjoy!'

