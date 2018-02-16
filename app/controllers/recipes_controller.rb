class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.user = current_user
      if @recipe.save
        redirect_to recipe_path(@recipe)
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :cooktime)
  end

end
