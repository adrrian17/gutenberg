json.array!(@books) do |book|
  json.extract! book, :book_id, :title, :published_date, :pages, :copies, :publishing_house_id, :category_id
  json.url book_url(book, format: :json)
end
