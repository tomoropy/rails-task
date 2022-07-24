class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update] 
  skip_before_action :authenticate_user!, only: [:show, :new]

  def new
    return redirect_to edit_profile_path(current_user) unless current_user.profile.blank?
    @profile = Profile.new
  end
  
  def edit
    return redirect_to edit_profile_path(current_user) unless current_user.id == @user.id
  end

  def show
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to root_path, sucsess: "プロフィールを作成しました"
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(current_user), sucsess: "プロフィールを更新しました"
    else 
      render :edit
    end
  end

  def destroy
  end

  private

  def find_profile
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def profile_params
    params.require(:profile).permit(
      :name, :profile_text, :image
    )
  end
end
