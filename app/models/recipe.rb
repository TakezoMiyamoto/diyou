class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :steps

  # Uploader
  mount_uploader :main_image, MainImageUploader

  accepts_nested_attributes_for :ingredients, reject_if: :reject_ingredients, allow_destroy: true # この行を追記
  accepts_nested_attributes_for :steps, reject_if: :reject_steps, allow_destroy: true # この行を追記

  def reject_ingredients(ingredients)
    exists = ingredients[:id].present?
    empty = ingredients[:material_name].blank?
    ingredients.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end

  def reject_steps(steps)
    exists = steps[:id].present?
    empty = steps[:description].blank?
    steps.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end
end
