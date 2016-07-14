class ChangeQtyToIngredients < ActiveRecord::Migration
  def change

    def up
      change_column :Ingredients, :qty, :string
    end

    #変更前の型
    def down
     change_column :Ingredients, :qty, :integer
    end
  end
end
