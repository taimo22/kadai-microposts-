class RelationFavorsController < ApplicationController
  before_action :require_user_logged_in
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.like(current_user)
    flash[:success] = 'お気に入り'
    redirect_to '/'

  end

  def destroy
    @micropost = RelationFavor.find(params[:id]).micropost
    @micropost.remove_like(current_user)
    flash[:success] = 'お気に入り解除'
    redirect_to '/'
  end
end
