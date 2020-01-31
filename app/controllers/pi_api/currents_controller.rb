class PiApi::CurrentsController < PiApi::ApplicationController
  def show
    # POSTにしたほうがより安全?
    if params[:token] == ENV['FIRST_USER_TOKEN']
      @task = current_user.tasks.where(scheduled_on: Time.current).doing.first
    else
      head 403
    end
  end
end
