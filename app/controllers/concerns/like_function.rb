module LikeFunction

  def like(likable_type)
    if likable_type.liked_by?(current_user)
      likable_type.unliked_by(current_user)
      redirect_to request.referer, success: "いいねを取り消しました"
    else
      likable_type.liked_by(current_user)
      redirect_to request.referer, success: "いいねしました"
    end
  end

  def like_mark
    @fill_like = "❤︎"
    @empty_like = "♡"
  end

end
