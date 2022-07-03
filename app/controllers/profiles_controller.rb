class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile, only: [:show, :edit, :update]
  
  def new
    return redirect_to edit_profile_path(current_user) if !current_user.profile.blank?
    @profile = Profile.new
  end
  
  def edit

  end

  def show

  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to root_path, notice: "プロフィールを作成しました"
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(current_user), notice: "プロフィールを更新しました"
    else 
      render :edit
    end
  end

  def destroy
    
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(
      :name, :profile_text, :image
    )
  end
end
