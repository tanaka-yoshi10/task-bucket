class ShortcutsController < ApplicationController
  before_action :set_shortcut, only: %i[show edit update destroy start]

  def index
    @shortcuts = current_user.shortcuts.default_order
  end

  def show
  end

  def new
    @shortcut = current_user.shortcuts.new
  end

  def edit
  end

  def create
    @shortcut = current_user.shortcuts.build(shortcut_params)

    if @shortcut.save
      redirect_to @shortcut, notice: 'Shortcut was successfully created.'
    else
      render :new
    end
  end

  def update
    if @shortcut.update(shortcut_params)
      redirect_to @shortcut, notice: 'Shortcut was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shortcut.destroy
    redirect_to shortcuts_url, notice: 'Shortcut was successfully destroyed.'
  end

  def start
    current_user.tasks.create!(title: @shortcut.title, project: @shortcut.project , start_at: Time.current)
    @tasks = current_user.tasks.where(scheduled_on: Time.current).order(start_at: :desc).order(:title).includes(:project)
  end

  private

  def set_shortcut
    @shortcut = current_user.shortcuts.find(params[:id])
  end

  def shortcut_params
    params.require(:shortcut).permit(:title, :project_id, :position)
  end
end
