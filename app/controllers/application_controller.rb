class ApplicationController < ActionController::Base
  helper_method :guest_user?

  def guest_user?
    current_user && current_user.email == User::GUEST_USER_EMAIL
  end
end
