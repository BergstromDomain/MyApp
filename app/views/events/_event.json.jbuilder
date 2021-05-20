json.extract! event, :id, :title, :details, :day, :month, :year, :main_image, :thumb_image, :created_at, :updated_at
json.url event_url(event, format: :json)
