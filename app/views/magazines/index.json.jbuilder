json.array!(@magazines) do |magazine|
  json.extract! magazine, :magazine_id, :title, :volume, :published_date, :copies
  json.url magazine_url(magazine, format: :json)
end
