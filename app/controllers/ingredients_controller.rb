class IngredientsController < ApplicationController


  def index
    if params[:recipe_id]
      @ingredients = Recipe.find(params[:recipe_id]).ingredients
    else
      @ingredients = Ingredient.all
    end 
  end

  def show
    @ingredient = Ingredient.find(params[:id])
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
