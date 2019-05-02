class DailyReportsController < ApplicationController
  def index
    @q = current_user.tasks.ransack(params.fetch(:q, scheduled_on_eq: Time.current))
    @tasks = @q.result.order(:start_at)
  end
end
