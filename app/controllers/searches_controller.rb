class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "ユーザー"
      @users = User.looks(params[:search], params[:word]).page(params[:page]).per(10)
    elsif @range == "投稿"
      @posts = Post.looks(params[:search], params[:word]).page(params[:page]).per(10)
    else
      @tags = Tag.looks(params[:search], params[:word]).page(params[:page]).per(10)
      @posts = @tags.flat_map { |tag| tag.posts.distinct }
    end
  end
end
