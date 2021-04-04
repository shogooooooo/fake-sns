class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def update
    profile = Profile.new(profile_params)
    profile.save
    @avatar = current_user.profile.avatar
    @avatar.attach(profile_params)
    @avatar.update!
    render json: @avatar
  end

  private

  def profile_params
    params.permit(:avatar)
  end
end