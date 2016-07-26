class RelationshipsController < ApplicationController
  def show
    @user = User.find(params[:favoriter_id])
    @recipe = Recipe.find(params[:favorited_id])
  end
  def create
    @recipe = Recipe.find(params[:favorited_id])
    current_user.favorite(@recipe)
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def destroy
    @recipe = current_user.favoring_relationships.find(params[:id]).favorited
    current_user.unfavorite(@recipe)
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end
end
