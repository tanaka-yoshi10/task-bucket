class Task < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user
  belongs_to :routine, optional: true

  validates :scheduled_on, presence: true
  validates :title, presence: true

  before_validation :set_scheduled_on
  before_validation :set_start_at
  before_validation :set_end_at

  scope :doing, -> { where.not(start_at: nil).where(end_at: nil) }
  scope :not_started, -> { where(start_at: nil).where(end_at: nil) }
  scope :completed, -> { where.not(start_at: nil).where.not(end_at: nil) }
  scope :not_completed, -> { where(end_at: nil) }
  scope :future, -> { where('tasks.scheduled_on >= ?', Time.current.tomorrow.to_date) }

  scope :default_order, -> { order(:scheduled_on, :start_at) }
  scope :newer, -> { order(scheduled_on: :desc, start_at: :desc) }

  def actual
    return nil if start_at.blank? || end_at.blank?

    (end_at - start_at) / 1.minute
  end

  def clone!
    user.tasks.create!(title: title, estimate: estimate, project: project)
  end

  def resume!
    Task.transaction do
      new_task = user.tasks.create!(title: title, estimate: estimate, project: project)
      new_task.update!(start_at: Time.current)
    end
  end

  def pause!
    Task.transaction do
      user.tasks.create!(title: title, project: project)
      self.update!(title: '[中断]' + title, end_at: Time.current)
    end
  end

  def postpone!
    update!(scheduled_on: Date.current.tomorrow)
  end

  def completed?
    start_at.present? && end_at.present?
  end

  def self.group_by_project
    all.group_by { |task| task.project }.sort_by { |k, _| k&.name.to_s }
  end

  private

  def set_scheduled_on
    return if scheduled_on.present?

    if start_at.present?
      self.scheduled_on = start_at
    elsif scheduled_on.blank?
      self.scheduled_on = Time.current
    end
  end

  def set_start_at
    return if start_at.blank?

    self.start_at = Time.zone.local(
      scheduled_on.year,
      scheduled_on.month,
      scheduled_on.day,
      start_at.hour,
      start_at.min,
      start_at.sec
    )
  end

  def set_end_at
    return if end_at.blank?

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
