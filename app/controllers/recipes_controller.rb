class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    3.times do
      ingredient = @recipe.ingredients.build
    end
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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @ingredient = @recipe.ingredients
      if @recipe.update(recipe_params)
        redirect_to @recipe
      else
        render :edit
      end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect_to recipes_path
  end
  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :cooktime, :ingredient_ids => [], ingredients_attributes: [:recipe_id, :name])
  end

end
