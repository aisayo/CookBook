class IngredientsController < ApplicationController
  before_action :authenticate_user!

  def index
      @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipe = Recipe.find_by(id: params[:recipe_id])
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.delete
    redirect_to ingredients_path
  end


  private
  def ingredients_params
    params.require(:ingredient).permit(:name)
  end
end
