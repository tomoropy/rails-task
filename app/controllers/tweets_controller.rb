class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all.order(created_at: "DESC")
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comment.order(created_at: "DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweet.build(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: "ツイートを投稿しました"
    else
      flash.now[:danger] = "ツイートの投稿に失敗しました"
      render :new 
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
