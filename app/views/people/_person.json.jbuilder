json.extract! person, :id, :first_name, :last_name, :main_image, :thumb_image, :created_at, :updated_at
json.url person_url(person, format: :json)
