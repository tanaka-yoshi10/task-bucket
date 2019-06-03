class Api::ApplicationController < ActionController::Base
  private

  def current_user
    # FIXME: 仮実装
    @current_user ||= User.first
  end
end
