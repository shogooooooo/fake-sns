class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @avatar = current_user.avatar
  end

  def update
    @avatar = current_user.avatar
    @avatar.attach(params[:avatar])
    if @avatar.update!(profile_params)
      redirect_to profile_path
    end
  end

  private

  def profile_params
    params.permit(avatar: [])
  end
end
