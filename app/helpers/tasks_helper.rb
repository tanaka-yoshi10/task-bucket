module TasksHelper
  def tasks_to_calendar_json(tasks)
    tasks.map do |task|
      {
        title: task.title,
        start: task.start_at.iso8601,
        end: task.end_at.iso8601,
      }
    end.to_json
  end
end
