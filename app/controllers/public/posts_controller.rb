class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @tag_list = @post.tags.pluck(:name).join(',')
    @post_tags = @post.tags
  end
  
  def index
    @posts = Post.all
    @tag_list = Tag.all
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    @tag_list=params[:post][:name].split(',')
    if @post.update(post_params)
      @post.save_tags(@tag_list)
      flash[:post_update] = "投稿更新に成功しました"
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @user = current_user
    @tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tags(@tag_list)
      flash[:post_create] = "投稿に成功しました"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts
  end

  private

  def post_params
    params.require(:post).permit(:body, :image)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
end
