class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    if current_user.avatar.attached?
      @avatar = current_user.avatar
    else 
      @avatar = current_user.avatar.attach(params[:avatar])
    end
    if @avatar.update!(profile_params)
      render json: @avatar
      redirect_to profile_path
  end

  private

  def profile_params
    params.require(:user).permit(:avatar)
  end
end