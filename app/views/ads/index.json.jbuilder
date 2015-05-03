json.array!(@ads) do |ad|
  json.extract! ad, :id, :title, :text, :published
  json.url ad_url(ad, format: :json)
end
