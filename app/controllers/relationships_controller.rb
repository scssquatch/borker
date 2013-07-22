class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:id])
    current_user.follow(@user)
    Notification.create(user_id: @user.id, content: "<a href=\"/users/#{current_user.id.to_s}\">#{current_user.username}</a> is now following you!")
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    Notification.find_by(user_id: @user.id, content: "<a href=\"/users/#{current_user.id.to_s}\">#{current_user.username}</a> is now following you!").destroy
    respond_to do |format|
      format.js
    end
  end
end
