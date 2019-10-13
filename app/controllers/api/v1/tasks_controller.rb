class Api::V1::TasksController < Api::V1::ApplicationController
  before_action :set_task, only: %i[complete]

  def complete
    @task.update!(end_at: Time.current)
    render :show
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
