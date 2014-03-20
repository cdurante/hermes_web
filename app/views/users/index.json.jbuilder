json.array!(@users) do |user|
  json.extract! user, :userName, :realName, :dob :id, :email, :lastlogin, :usertype
  json.url user_url(user, format: :json)
end