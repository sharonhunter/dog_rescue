json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :age, :gender, :breed, :secondary_breed, :heartworm_status, :temperament, :activity_level, :info, :available, :contact_name, :contact_phone
  json.url dog_url(dog, format: :json)
end
