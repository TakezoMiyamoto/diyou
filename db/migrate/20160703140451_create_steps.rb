class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :recipe, index: true, foreign_key: true
      t.string :step_image
      t.text :description

      t.timestamps null: false
    end
  end
end
