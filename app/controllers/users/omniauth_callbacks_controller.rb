# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:github]

  # You should also create an action method in this controller like this:
  def github
    # request.env["omniauth.auth"]にGitHubから送られてきたデータが入っている
    @user = User.find_for_github_oauth(request.env["omniauth.auth"])

    if @user.persisted? # データベースに保存されていればログイン成功
      if @user.profile.blank? 
        redirect_to new_profile_path, event: :authentication #プロフィールを作成していなければ、作成
      else
        sign_in_and_redirect @user, event: :authentication #プロフィールを作成していれば、ログイン
      end

      set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
    else # ログイン失敗
      session["devise.github_data"] = request.env["omniauth.auth"].expect(:extra)
      redirect_to new_user_registration_url
    end
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/github
  def passthru
    super
  end

  # GET|POST /users/auth/github/callback
  def failure
    super
  end

  protected

  # The path used when OmniAuth fails
  def after_omniauth_failure_path_for(scope)
    super(scope)
  end
end
