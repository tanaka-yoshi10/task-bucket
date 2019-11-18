class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy start complete clone pause postpone resume]
  before_action :set_tasks, only: %i[index create update start complete clone pause postpone resume]

  def index
    @tasks = current_user.tasks.where(scheduled_on: Time.current).order(start_at: :desc).order(:title).includes(:project)
    @new_task = current_user.tasks.build
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
    session[:return_to] = request.referer
  end

  def create
    @task = current_user.tasks.build(task_params)
    if params[:commit] == '開始'
      @task.start_at = Time.current
    elsif params[:commit] == '直前のタスクの終了時刻'
      @task.start_at = current_user.last_end_at
    end

    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.js
        format.json { render 'show' }
      end
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      respond_to do |format|
        format.html { redirect_to(session.delete(:return_to) || task_path(@task), notice: 'Task was successfully updated.') }
        format.js { render :index }
      end
    else
      render :edit
    end
  end

  def destroy
    @task.destroy!
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.js
    end
  end

  def start
    if params[:from_just_before].present?
      @task.update!(start_at: current_user.last_end_at)
    else
      @task.update!(start_at: Time.current)
    end
    render :index
  end

  def complete
    @task.update!(end_at: Time.current)
    render :index
  end

  def pause
    @task.pause!
    render :index
  end

  def clone
    @task.clone!
    render :index
  end

  def resume
    @task.resume!
    render :index
  end

  def not_completed
    @tasks = current_user.tasks.not_completed.order(:scheduled_on, :title)
  end

  def postpone
    @task.postpone!
    render :index
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def set_tasks
    @tasks = current_user.tasks.where(scheduled_on: Time.current).order(start_at: :desc).order(:title).includes(:project)
  end

  def task_params
    params.require(:task).permit(:scheduled_on, :start_at, :end_at, :estimate, :project_id, :title, :comment)
  end
end
