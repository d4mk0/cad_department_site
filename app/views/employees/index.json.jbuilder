json.array!(@employees) do |employee|
  json.extract! employee, :id, :full_name, :photo, :post, :academic_degree, :academic_title, :description, :published, :position
  json.url employee_url(employee, format: :json)
end
