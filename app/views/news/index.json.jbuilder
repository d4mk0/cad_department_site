json.array!(@news) do |news|
  json.extract! news, :id, :title, :short_description, :text, :published
  json.url news_url(news, format: :json)
end
