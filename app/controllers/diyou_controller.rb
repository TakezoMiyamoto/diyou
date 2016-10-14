class DiyouController < ApplicationController
  def home
    # 直近のプロジェクト６件を取得
    @recipes = Recipe.order(created_at: :desc).limit(6)
    @title = "Home"
  end

  def about
    @title = "Made In Meとは？"
  end


  def term

  end

  def privacy

  end
end
