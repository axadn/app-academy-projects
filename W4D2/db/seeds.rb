# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.create(name: "Mr.Whiskers",
  color: "black",
  sex: "M",
  birth_date: Date.new(2010,1,1),
  description: "My best buddy")

  Cat.create(name: "Mrs.Whiskers",
    color: "black",
    sex: "F",
    birth_date: Date.new(2010,1,1),
    description: "Mr.Whiskekers wife")

CatRentalRequest.create(cat_id: 1, start_date: Date.new(2000,12,1), end_date: Date.new(2000,12,5), status: 'DENIED')
CatRentalRequest.create(cat_id: 2, start_date: Date.new(2000,12,4), end_date: Date.new(2000,12,7), status: 'DENIED')
CatRentalRequest.create(cat_id: 2, start_date: Date.new(2000,12,9), end_date: Date.new(2000,12,10), status: 'DENIED')
# create_table "cats", force: :cascade do |t|
#   t.date "birth_date", null: false
#   t.string "color", null: false
#   t.string "name", null: false
#   t.string "sex", limit: 1, null: false
#   t.text "description"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
CatRentalRequest.create(cat_id: 2, start_date: Date.new(1999,12,9), end_date: Date.new(2000,12,5), status: 'DENIED')
