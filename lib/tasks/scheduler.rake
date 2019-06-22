namespace :cron do
  desc 'リピートタスクを作成する'
  task create_repeat_tasks: :environment do
    puts "start create_repeat_tasks :#{Time.current}"
    Routine.create_repeat_tasks!
    puts "finish create_repeat_tasks :#{Time.current}"
  end

  desc 'Daily Reportを送る'
  task send_daily_reports: :environment do
    puts "start send_daily_reports :#{Time.current}"
    Task.send_daily_reports!
    puts "finish send_daily_reports :#{Time.current}"
  end
end
