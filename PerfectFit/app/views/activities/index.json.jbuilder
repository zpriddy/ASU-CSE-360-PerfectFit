json.array!(@activities) do |activity|
  json.extract! activity, :user_id, :date, :activity_type, :duration, :calories, :distance, :steps, :floors, :laps, :mood, :notes
  json.url activity_url(activity, format: :json)
end