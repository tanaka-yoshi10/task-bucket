class PiApi::ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    # TODO: いずれはtokenからuserを引っ張るように
    User.find(1)
  end
end
