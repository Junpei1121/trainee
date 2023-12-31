# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def after_sign_in_path_for(resource)
     user_path(current_user)
  end
  
  def after_sign_out_path_for(resource_or_scope)
     root_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
   private

  def user_state
    user = User.find_by(email: params[:user][:email])
    return if user.nil?
    if user.is_active
      return unless user.valid_password?(params[:user][:password])
    else
      flash[:withdraw] = "退会済みのため、新規登録をお願い致します"
      redirect_to new_user_registration_path
    end
  end
end
