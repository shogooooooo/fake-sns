class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def update
    @avatar = current_user.avatar
    @avatar.attach(params[:avatar])
    @avatar.update!(profile_params)
    render json: @avatar
  end

  private

  def profile_params
    params.permit(:avatar)
  end
end