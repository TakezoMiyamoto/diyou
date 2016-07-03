class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :recipe, index: true, foreign_key: true
      t.string :material_name
      t.integer :qty
      t.string :ing_image

      t.timestamps null: false
    end
  end
end
