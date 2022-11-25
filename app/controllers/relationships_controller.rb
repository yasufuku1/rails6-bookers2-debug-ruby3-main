class RelationshipsController < ApplicationController
  def create
    current_user.relationships.create(followed_id: params[:user_id])
    redirect_to request.referer
  end

  def destroy
    following = current_user.relationships.find_by(followed_id: params[:user_id])
    following.destroy
    redirect_to request.referer
  end

  #フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @user = user.followings
  end

  #フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @user = user.followers
  end

end
