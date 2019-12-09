class MonthlyReportsController < ApplicationController
  def index
    @date = begin
      Date.parse("#{params[:date]}-01")
    rescue ArgumentError
      Time.current.to_date
    end
    @date = @date.beginning_of_month

    @tasks = current_user.tasks.where(scheduled_on: @date.all_month).default_order
  end
end
