# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Delete all entries
Dose.delete_all

Cocktail.delete_all
Ingredient.delete_all

# List of new entries

seed_ing  = [ 'lemon', 'whiskey', 'rum', 'cocke', 'gin', 'tonic' ]
seed_coc  = [ 'gin tonic', 'whiskey sour', 'cuba libre' ]

# Generate new

seed_ing.each do |ingredient|
  Ingredient.create!(name: ingredient)
end

seed_coc.each do |cocktail|
  Cocktail.create!(name: cocktail)
end

dose_helper = [
  {
    description:  "6cl",
    ingredient:   Ingredient.find_by(name: 'whiskey'),
    cocktail:     Cocktail.find_by(name: 'whiskey sour')
  }, {
    description:  "4cl",
    ingredient:   Ingredient.find_by(name: 'lemon'),
    cocktail:     Cocktail.find_by(name: 'whiskey sour')
  }, {
    description:  "8cl",
    ingredient:   Ingredient.find_by(name: 'gin'),
    cocktail:     Cocktail.find_by(name: 'gin tonic')
  }, {
    description:  "6cl",
    ingredient:   Ingredient.find_by(name: 'tonic'),
    cocktail:     Cocktail.find_by(name: 'gin tonic')
  }
]

dose_helper.each do |dose|
  Dose.create!(dose)
end
