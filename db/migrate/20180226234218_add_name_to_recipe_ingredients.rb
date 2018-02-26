class AddNameToRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_ingredients, :name, :string
  end
end
