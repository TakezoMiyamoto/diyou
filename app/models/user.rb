class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Relations
  has_many :recipes

  #relationships
  has_many :favoring_relationships, class_name:  "Relationship",
                                     foreign_key: "favoriter_id",
                                     dependent:   :destroy
  has_many :favorited_recipes, through: :favoring_relationships, source: :favorited

  # relationships methods
  # プロジェクトにジョインする
  def favorite(recipe)
    favoring_relationships.find_or_create_by(favorited_id: recipe.id)
  end

  # ジョインしているプロジェクトをアンジョインする
  def unfavorite(recipe)
    favoring_relationships.find_by_favorited_id(recipe.id).destroy
  end

  # あるプロジェクトにジョインしているかどうか？
  def favoring?(recipe)
    favorited_recipes.include?(recipe)
  end

  # Uploader
  mount_uploader :avatar, AvatarUploader

  # facebook oath
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        username: auth.info.name,
        email: auth.info.email,
        remote_avatar: auth.info.image,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end
end
