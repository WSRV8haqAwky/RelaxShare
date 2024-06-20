class FavoritesController < ApplicationController

  def create
    post_relax = PostRelax.find(params[:post_relax_id])
    favorite = current_user.favorites.new(post_relax_id: post_relax.id)
    favorite.save
    redirect_to post_relax_path(post_relax)
  end

  def destroy
    post_relax = PostRelax.find(params[:post_relax_id])
    favorite = current_user.favorites.find_by(post_relax_id: post_relax.id)
    favorite.destroy
    redirect_to post_relax_path(post_relax)
  end
end
