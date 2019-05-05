namespace :cron do
  desc 'リピートタスクを作成する'
  task create_repeat_tasks: :environment do
    puts "start create_repeat_tasks :#{Time.current}"
    Routine.create_repeat_tasks!
    puts "finish create_repeat_tasks :#{Time.current}"
  end
end
