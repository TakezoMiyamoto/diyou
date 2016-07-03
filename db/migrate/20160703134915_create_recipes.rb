class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :recipe_name
      t.string :category
      t.string :main_image
      t.string :level
      t.integer :time
      t.integer :cost
      t.string :youtube_url

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
