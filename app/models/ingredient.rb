class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  mount_uploader :ing_image, IngImageUploader
end
