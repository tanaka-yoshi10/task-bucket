class Api::TasksController < Api::ApplicationController
  before_action :set_task, only: %i[complete]

  def index
    @tasks = current_user.tasks.not_completed.where(scheduled_on: Time.current).order(start_at: :desc).order(:title).includes(:project)
  end

  def complete
    @task.update!(end_at: Time.current)
    render :index
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
