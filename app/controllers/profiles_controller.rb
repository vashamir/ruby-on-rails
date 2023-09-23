# frozen_string_literal: true

# class
class ProfilesController < ApplicationController
  def show
    @profile = User.find(params[:id])
  end

  def edit
    @profile = User.find(params[:id])
  end

  def update
    @profile = User.find(params[:id])
    @profile.update(nickname: params[:nickname], about_me: params[:about_me])

    redirect_to profile_path(@profile)
  end
end
