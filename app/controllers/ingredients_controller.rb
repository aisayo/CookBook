class IngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = @recipe.ingredients.all
  end

  def show
  end

  def new
    @ingredient = @recipe.ingredients.new
  end

  def create
    @ingredient = @recipe.ingredients.create(ingredients_params)
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

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
