json.array!(@users) do |user|
  json.extract! user, :userName, :realName, :dob, :userKey, :email, :lastlogin, :signedup, :usertype
  json.url user_url(user, format: :json)
end