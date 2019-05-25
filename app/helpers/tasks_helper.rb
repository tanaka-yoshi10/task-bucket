module TasksHelper
  def tasks_to_calendar_json(tasks)
    tasks.map do |task|
      {
        title: task.title,
        start: task.start_at.iso8601,
        end: task.end_at.iso8601,
        backgroundColor: task.project&.color,
        textColor: 'white'
      }
    end.to_json
  end
end
