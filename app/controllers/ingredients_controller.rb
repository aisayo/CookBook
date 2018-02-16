class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredients_params)
    if @ingredient.save
      render new_recipe_path
    else
      render :new
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end


  private
  def ingredients_params
    params.require(:ingredient).permit(:name)
  end





end
