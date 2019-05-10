json.set! :task do
  json.extract! @task, :id, :title, :created_at, :updated_at
end
