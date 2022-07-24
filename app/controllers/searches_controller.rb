class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "ツイート"
      @tweets = Tweet.looks(params[:word])
    elsif @range = "コメント"
      @comments = Comment.looks(params[:word])
    end
  end
end
