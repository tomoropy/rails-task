class CommentsController < ApplicationController
  before_action :find_tweet_id

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comment.new(comment_params)
    if @comment.save
      redirect_to tweet_path(@comment.tweet_id), success: "コメントを投稿しました。"
    else
      redirect_to new_tweet_comment_path(@tweet_id), danger: "コメントの投稿に失敗しました。"
    end
  end

  private

  def find_tweet_id
    @tweet_id = params[:tweet_id]
  end

  def comment_params
    params.require(:comment).permit(:tweet_id, :text)
  end
end
