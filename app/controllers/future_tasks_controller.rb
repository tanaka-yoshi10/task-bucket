class FutureTasksController < ApplicationController
  def index
    @tasks = current_user.tasks.future.order(:scheduled_on, :title)
  end

  def new
    @task = current_user.tasks.new(scheduled_on: Time.current.tomorrow)
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to future_tasks_url, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:scheduled_on, :estimate, :project_id, :title)
  end
end
