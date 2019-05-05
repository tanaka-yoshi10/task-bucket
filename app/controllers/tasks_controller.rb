class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy start complete clone]

  def index
    @q = current_user.tasks.ransack(params.fetch(:q, scheduled_on_eq: Time.current))
    @tasks = @q.result.order(start_at: :desc).order(:title).includes(:project)
    @new_task = current_user.tasks.build
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)
    if params[:commit] == '開始'
      @task.start_at = Time.current
    elsif params[:commit] == '直前のタスクの終了時刻'
      @task.start_at = current_user.tasks.order(:end_at).pluck(:end_at).compact.last
    end

    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.js
      end
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
  end

  def complete
    @task.update!(end_at: Time.current)
  end

  def clone
    @task = @task.clone!
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:scheduled_on, :start_at, :end_at, :estimate, :project_id, :title, :comment)
  end
end
