class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

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
