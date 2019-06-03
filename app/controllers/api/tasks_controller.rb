class Api::TasksController < Api::ApplicationController
  before_action :set_task, only: %i[complete]

  def index
    @tasks = []
  end

  def doing
    @tasks = current_user.tasks.doing.where(scheduled_on: Time.current).order(start_at: :desc).order(:title).includes(:project)
    render :index
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
