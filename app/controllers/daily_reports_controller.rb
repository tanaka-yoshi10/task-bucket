class DailyReportsController < ApplicationController
  def index
    @date = begin
      Date.parse(params[:date].to_s)
    rescue ArgumentError
      Time.current
    end

    @tasks = current_user.tasks.where(scheduled_on: @date).order(:start_at)
  end
end
