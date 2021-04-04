class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    
  end

  def update
    @avatar = curent_user.avatar.attach(params[:avatar])
    
    @avatar.update!

    render json: @avatar
  end

  private

  def profile_params
    params.require(:user).permit(:avatar)
  end
end