class Routine < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user

  has_many :tasks, dependent: :nullify

  # validates :recurrence, presence: true
  # attribute :recurrence, :string, default: -> { 'FREQ=DAILY' }

  scope :active, -> { where(active: true) }

  def self.create_repeat_tasks!
    current = Time.current
    Routine.transaction do
      Routine.active.find_each do |routine|
        next if routine.tasks.where(scheduled_on: current).exists?

        routine.tasks.create!(
          title: routine.title,
          user: routine.user,
          project: routine.project,
          estimate: routine.estimate
        )
      end
    end
  end
end
