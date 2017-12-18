# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(user_name: "hello", password: "password")
User.create(user_name: "hello1", password: "password")
User.create(user_name: "hello2", password: "password")
Cat.create(sex: "M", birth_date: Date.new(2016,10,2),
  color: "black", name: "Whiskers", description: "IM A BLACK CAT" ,owner_id: 1)
Cat.create(sex: "F", birth_date: Date.today,
  color: "white", name: "paws", description: "IM A WHITE CAT", owner_id: 2 )
