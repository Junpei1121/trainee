class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:edit] = "登録情報変更に成功しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def index
    @users = User.all
  end

  def withdraw_confirm
  end

  def withdraw
    current_user.update(is_active: false)
    reset_session
    flash[:withdraw] = "退会処理を実行しました"
    redirect_to root_path
  end
  
  def favorites 
    @user = User.find(params[:id])
    post_favorites = PostFavorite.where(user_id: @user.id).pluck(:post_id)
    @post_favorite_posts = Post.find(post_favorites)
    # @posts = Post.find(params[:id])
  end
  
  def follows
    @user = User.find(params[:id])
    @users = @user.following_users
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
  
end
