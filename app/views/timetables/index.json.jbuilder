json.array!(@timetables) do |timetable|
  json.extract! timetable, :id, :position, :title, :code
  json.url timetable_url(timetable, format: :json)
end
