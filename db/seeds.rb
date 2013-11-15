# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create(
  [{first_name:'John', last_name:'Smith', email:'example@mail.com', password: '1234567890', 
    password_confirmation: '1234567890', is_admin: false},
  {first_name:'Adrian', last_name:'Ayala', email:'adrian.ayala@gmail.com', password: '1234567890', 
    password_confirmation: '1234567890', is_admin: true}])

categories = Category.create(
  [{category:'Ciencia Ficción', slug:'ciencia-ficcion'}, 
  {category:'Terror', slug:'terror'},
  {category:'Política', slug:'politica'},
  {category:'Historia', slug:'historia'}])

books = Book.create(
  [{title:'Las Crónicas de Narnia', published_date:Time.now, pages:16, copies:2, publishing_house_id:1, category_id:1, slug:'las-cronicas-de-narnia'}, 
  {title:'La Cúpula', published_date:Time.now, pages:150, copies:5, publishing_house_id:1, category_id:2, 
    slug:'la-cupula'},
  {title:'Libro de historia', published_date:Time.now, pages:40, copies:3, publishing_house_id:1, category_id:4, slug:'libro-de-historia'},
  {title:'Otro libro de historia', published_date:Time.now, pages:100, copies:1, publishing_house_id:1, category_id:4, slug:'otro-libro-de-historia'}])

magazines = Magazine.create(
  [{title:'Proceso', volume:'Q2', published_date:Time.now, copies:2, item_types_id:1, category_id:1, 
    slug:'proceso'},
  {title:'Muy interesante', volume:'Q4', published_date:Time.now, copies:5, item_types_id:1, category_id:1, 
    slug:'proceso'},
  {title:'Quo', volume:'Q1', published_date:Time.now, copies:3, item_types_id:1, category_id:2, 
    slug:'proceso'}])

authors = Author.create(
  [{first_name:'John', last_name:'Smith', slug:'john-smith'}, 
  {first_name:'Adrian', last_name:'Ayala', slug:'adrian-ayala'}, 
  {first_name:'Daniel', last_name:'Martinez', slug:'daniel-martinez'}])

books.each do |book|
  authors.each do |author|
    book.authors << author
  end
end