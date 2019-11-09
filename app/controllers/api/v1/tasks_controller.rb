class Api::V1::TasksController < Api::V1::ApplicationController
  before_action :set_task, only: %i[start complete]

  def start
    if params[:from_just_before].present?
      @task.update!(start_at: current_user.last_end_at)
    else
      @task.update!(start_at: Time.current)
    end
    render :show
  end

  def complete
    @task.update!(end_at: Time.current)
    render :show
  end

  def postpone
    @task.postpone!
    render :show
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
