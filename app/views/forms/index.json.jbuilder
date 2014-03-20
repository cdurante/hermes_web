json.array!(@forms) do |form|
  json.extract! form, :formkey, :dateshared, :duedate, :source
  json.url form_url(form, format: :json)
end