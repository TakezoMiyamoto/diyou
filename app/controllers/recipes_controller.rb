class RecipesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :recipe_owner, only: [:edit, :update, :destroy]
  before_action :category_set, only: [:new, :index, :edit]
  before_action :recipe_find, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.order(created_at: :desc)

    @title = "レシピ一覧"


  end

  def readyfor
    @title = "はじめよう！"
  end

  def new
    @recipe = Recipe.new
    2.times{ @recipe.ingredients.build }
    @recipe.steps.build
    @title = "新規レシピ作成"


  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = "新規プロジェクトを作成しました"
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def show

    @recipe_title = @recipe.recipe_name

  end

  def edit

  end

  def update

    if @recipe.update(edit_recipe_params)
      flash[:success] = "プロジェクト内容が更新されました"
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = current_user.recipes.find_by(id: params[:id])
    return redirect_to root_url if @recipe.nil?
    @recipe.destroy
    flash[:success] = "プロジェクトは削除されました"
    redirect_to recipes_path
  end


# 編集中
private

  def category_set
    @categories = ["アクセサリー","ガーデン","水回り","椅子","机", "その他"]
  end

  def recipe_find
    @project = Project.find(params[:id])
  end

  def recipe_params
    params
      .require(:project).permit(:recipe_name, :category, :main_image, :level, :time, :cost, :youtube_url)
  end

  def edit_recipe_params
    params.require(:project).permit(:recipe_name, :category, :main_image, :level, :time, :cost, :youtube_url,
      ingredients: [:id, :material_name, :qty, :ing_image])
  end

  #recipe のオーナーかどうか判断
  def recipe_owner
    @recipe = Recipe.find(params[:id])
    unless @recipe.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this project'
      redirect_to recipes_path
    end
  end

end
