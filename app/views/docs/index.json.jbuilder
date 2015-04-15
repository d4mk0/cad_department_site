json.array!(@docs) do |doc|
  json.extract! doc, :id, :name
  json.url doc_url(doc, format: :json)
end
