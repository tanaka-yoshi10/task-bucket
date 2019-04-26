class Task < ApplicationRecord
  belongs_to :project, optional: true

  validates :scheduled_on, presence: true

  before_validation :set_scheduled_on

  def actual
    return nil if start_at.blank? || end_at.blank?

    (end_at - start_at) / 1.minute
  end

  private

  def set_scheduled_on
    if start_at.present?
      self.scheduled_on = start_at
    elsif scheduled_on.blank?
      self.scheduled_on = Time.current
    end
  end
end
