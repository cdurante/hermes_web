json.array!(@appointments) do |appointment|
  json.extract! appointment, :date, :location, :notes
  json.url appointment_url(appointment, format: :json)
end