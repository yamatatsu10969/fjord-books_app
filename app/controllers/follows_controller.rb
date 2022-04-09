# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    followee_id = params[:followee_id]
    @follow = Follow.new(followee_id: followee_id, follower_id: current_user.id)
    @follow.save!
    redirect_to user_path(followee_id)
  end

  def destroy
    @follow = Follow.find(params[:id])
    followee_id = @follow.followee_id
    @follow.destroy
    redirect_to user_path(followee_id)
  end
end
