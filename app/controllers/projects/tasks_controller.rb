class Projects::TasksController < ApplicationController
  before_action :set_project

  def index
    @tasks = @project.tasks.includes(:project).newer.order(:title).page(params[:page])
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end
end
