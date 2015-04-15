json.array!(@versions) do |version|
  json.extract! version, :id, :doc_id, :path
  json.url version_url(version, format: :json)
end
