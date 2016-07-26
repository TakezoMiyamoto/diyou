class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :steps

  # Uploader
  mount_uploader :main_image, MainImageUploader

  accepts_nested_attributes_for :ingredients, allow_destroy: true # この行を追記
  accepts_nested_attributes_for :steps, allow_destroy: true # この行を追記

  #relationships
  has_many :favoring_relationships, class_name:  "Relationship",
                                    foreign_key: "favorited_id",
                                    dependent:   :destroy
  has_many :favoriter_users, through: :favoring_relationships, source: :favoriter

end
