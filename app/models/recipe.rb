class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :steps

  accepts_nested_attributes_for :ingredients, allow_destroy: true # この行を追記
  accepts_nested_attributes_for :steps, allow_destroy: true # この行を追記
end
