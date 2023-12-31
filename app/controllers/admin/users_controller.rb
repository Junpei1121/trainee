class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    #ゲストログインのユーザー以外
    @users = User.page(params[:page]).per(10).where.not(email: "guest@example.com")
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:admin_user] = "更新成功"
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :is_active, :email)
  end
end
