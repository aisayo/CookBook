class IngredientsController < ApplicationController

  def new
    if params[:recipe_id] && !Recipe.exists?(params[:recipe_id])
      redirect_to recieps_path, alert: "Recipe not found."
    else
      @ingredient = Ingredient.new(recipe_id: params[:recipe_id])
    end
  end

  def index
      @ingredients = Ingredient.all
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
    params.require(:ingredient).permit(:name, :recipe_id)
  end





end
