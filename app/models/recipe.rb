class Recipe < ApplicationRecord
  belongs_to :user, required: false
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients


  def ingredients_attributes=(ingredients_attributes)
    binding.pry
    ingredients_attributes.values.each do |ingredients_attribute|
      if !ingredients_attribute.empty?
        new_ingredient = Ingredient.find_or_create_by(ingredients_attribute)
        self.ingredients << new_ingredient
      end
    end
  end

end
