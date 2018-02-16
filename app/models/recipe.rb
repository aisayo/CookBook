class Recipe < ApplicationRecord
  belongs_to :user, required: false
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients


  def items_attributes=(item_attributes)
    item_attributes.values.each do |ingredient_attribute|
      if !item_attribute.empty?
        new_ingredient = Item.find_or_create_by(item_attribute)
        self.ingredients << new_ingredient
      end
    end
  end

end
