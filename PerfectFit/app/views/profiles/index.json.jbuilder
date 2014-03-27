json.array!(@profiles) do |profile|
  json.extract! profile, :first_name, :last_name, :age, :gender, :weight, :zipcode, :birthday, :user_id
  json.url profile_url(profile, format: :json)
end