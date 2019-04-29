class Task < ApplicationRecord
  belongs_to :project, optional: true

  validates :scheduled_on, presence: true

  before_validation :set_scheduled_on
  before_validation :set_time

  def actual
    return nil if start_at.blank? || end_at.blank?

    (end_at - start_at) / 1.minute
  end

  def clone!
    Task.create!(title: title, estimate: estimate, project: project)
  end

  private

  def set_scheduled_on
    if scheduled_on.blank?
      if start_at.present?
        self.scheduled_on = start_at
      else scheduled_on.blank?
        self.scheduled_on = Time.current
      end
    end
  end

  def set_time
    if start_at.present?
      self.start_at = Time.zone.local(
        scheduled_on.year,
        scheduled_on.month,
        scheduled_on.day,
        start_at.hour,
        start_at.min,
        start_at.sec
      )
    end
    if end_at.present?
      self.end_at = Time.zone.local(
        scheduled_on.year,
        scheduled_on.month,
        scheduled_on.day,
        end_at.hour,
        end_at.min,
        end_at.sec
      )
    end
  end
end
