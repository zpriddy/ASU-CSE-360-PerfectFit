json.array!(@healths) do |health|
  json.extract! health, :user_id, :log_type, :weight, :food, :calories, :BPM, :BP, :BMI, :date, :sleep, :cholesterol
  json.url health_url(health, format: :json)
end