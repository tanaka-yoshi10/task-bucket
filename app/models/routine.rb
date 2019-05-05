class Routine < ApplicationRecord
  belongs_to :project
  belongs_to :user

  def self.create_repeat_tasks!
    Routine.transaction do
      Routine.find_each do |routine|
        Task.create!(
          title: routine.title,
          user: routine.user,
          project: routine.project,
          estimate: routine.estimate,
        )
      end
    end
  end
end
