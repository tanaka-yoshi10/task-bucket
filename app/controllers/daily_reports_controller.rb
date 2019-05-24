class DailyReportsController < ApplicationController
  def index
    @date = begin
      Date.parse(params[:date].to_s)
            rescue ArgumentError
              Time.current.to_date
    end

    @tasks = current_user.tasks.where(scheduled_on: @date).default_order
  end
end
