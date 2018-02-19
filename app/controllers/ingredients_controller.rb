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
    params.require(:ingredient).permit(:name)
  end





end
