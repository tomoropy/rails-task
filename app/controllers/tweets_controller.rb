class TweetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_tweet, only: [:show, :like_tweet]
  before_action :like_mark

  def index
    @tweets = Tweet.all.order(created_at: "DESC")
  end

  def show
    @comments = @tweet.comment.order(created_at: "DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweet.build(tweet_params)
    if @tweet.save
      redirect_to root_path, success: "ツイートを投稿しました"
    else
      redirect_to new_tweet_path, danger: "ツイートの投稿に失敗しました"
    end
  end

  def like_tweet
    like(@tweet)
  end

  private

  def like_mark
    @fill_like = "❤︎"
    @empty_like = "♡"
  end

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
