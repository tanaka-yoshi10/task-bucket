class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :routines, dependent: :destroy
  has_many :shortcuts, dependent: :destroy

  def admin?
    id == 1
  end

  def last_end_at
    tasks.order(:end_at).pluck(:end_at).compact.last
  end

  def self.send_daily_reports!
    SummaryMailer.daily_report(User.first).deliver_now
  end
end
