# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{first_name:'John', last_name:'Smith', email:'john.smith@mail.com', is_admin: false}])
categories = Category.create({category:'Ciencia Ficción'})
books = Book.create({title:'Las Crónicas de Narnia', published_date:Time.now, pages:16, copies:2, publishing_house_id:1, category_id:categories.id})
magazines = Magazine.create([{title:'Proceso', volume:'Q2', published_date:Time.now, copies:2, item_types_id:1, category_id:categories.id}])
authors = Author.create({first_name:'John', last_name:'Smith'})

books.authors << authors