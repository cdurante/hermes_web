json.array!(@appointments) do |appointment|
  json.extract! appointment, :appointmentKey, :date, :location, :notes
  json.url appointment_url(appointment, format: :json)
end