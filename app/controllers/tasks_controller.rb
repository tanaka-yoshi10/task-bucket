class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy start complete clone]

  def index
    @q = Task.ransack(params.fetch(:q, scheduled_on_eq: Time.current))
    @tasks = @q.result.order(start_at: :desc)
    @new_task = Task.new
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if params[:commit] == '開始'
      @task.start_at = Time.current
    end

    if @task.save
      redirect_to tasks_url, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      respond_to do |format|
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  def start
    @task.update!(start_at: Time.current)
    redirect_to tasks_url, notice: 'Task was successfully started.'
  end

  def complete
    @task.update!(end_at: Time.current)
    redirect_to tasks_url, notice: 'Task was successfully completed.'
  end

  def clone
    @task.clone!
    redirect_to tasks_url, notice: 'Task was successfully cloned.'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:scheduled_on, :start_at, :end_at, :estimate, :project_id, :title, :comment)
  end
end
