json.array!(@authors) do |author|
  json.extract! author, :author_id, :first_name, :last_name, :country_id, :born_date
  json.url author_url(author, format: :json)
end
