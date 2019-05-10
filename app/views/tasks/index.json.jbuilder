json.set! :tasks do
  json.array! @tasks do |task|
    json.extract! task, :id, :title, :created_at, :updated_at
  end
end
