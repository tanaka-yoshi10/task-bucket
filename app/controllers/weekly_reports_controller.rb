class WeeklyReportsController < ApplicationController
  def index
    @date = begin
      Date.parse(params[:date].to_s)
    rescue ArgumentError
      Time.current.to_date
    end
    @date = @date.beginning_of_week

    @tasks = current_user.tasks.where(scheduled_on: @date.all_week).order(:scheduled_on, :start_at)
  end
end
