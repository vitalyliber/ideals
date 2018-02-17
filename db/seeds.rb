# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ name: 'Food' }, { name: 'Drink' }])
Product.create([
  { name: 'Beef', price: 42.69, category: categories.first },
  { name: 'Food', price: 64.54, category: categories.first },
  { name: 'Soda', price: 20.23, category: categories.last },
  { name: 'Coffee', price: 19.66, category: categories.last },
  { name: 'Milk', price: 11.33, category: categories.last },
])