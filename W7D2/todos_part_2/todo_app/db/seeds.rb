# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


todo1 = Todo.create(title: "wash the car", body: "with soap", done: false)
todo2 = Todo.create(title: "wash the cat", body: "with shampoo", done: true)

step1 = Step.create(todo_id: todo1.id, title: "get the soap", body: "ajax brand", done: false)
step2 = Step.create(todo_id: todo2.id, title: "get the bubbles", body: "sync brand", done: true)
