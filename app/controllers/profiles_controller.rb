class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
  end


  def update
    @avatar = current_user.avatar
    @avatar.attach(profile_params)
    @avatar.update!
    render json: @avatar
  end

  private
  def profile_params
    params.require(:user).permit(:avatar)
  end
end