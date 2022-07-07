class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :tweet_params, only: [:edit, :create, :update]

  def index
    @tweets = Tweet.all
  end

  def show
    
  end

  def new
    @tweet = Tweet.new
  end

  def edit

  end

  def create
    @tweet = current_user.tweet.build(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: "ツイートを投稿しました"
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  private

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
