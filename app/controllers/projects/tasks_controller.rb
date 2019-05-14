class Projects::TasksController < ApplicationController
  before_action :set_project

  def index
    @tasks = @project.tasks.includes(:project).order(start_at: :desc).order(:title).page(params[:page]).per(10)
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end
end
