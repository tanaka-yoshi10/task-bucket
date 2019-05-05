class RoutinesController < ApplicationController
  before_action :set_routine, only: %i[show edit update destroy]

  # GET /routines
  def index
    @routines = current_user.routines.all
  end

  # GET /routines/1
  def show
  end

  # GET /routines/new
  def new
    @routine = current_user.routines.build
  end

  # GET /routines/1/edit
  def edit
  end

  # POST /routines
  def create
    @routine = current_user.routines.build(routine_params)

    if @routine.save
      redirect_to @routine, notice: 'Routine was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /routines/1
  def update
    if @routine.update(routine_params)
      redirect_to @routine, notice: 'Routine was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /routines/1
  def destroy
    @routine.destroy
    redirect_to routines_url, notice: 'Routine was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_routine
    @routine = current_user.routines.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def routine_params
    params.require(:routine).permit(:recurrence, :title, :estimate, :project_id)
  end
end
