class ingredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredients_params)
    if @ingredient.save
      render ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end


  private
  def ingredients_params
    params.require(:ngredient).permit(:name, :quantity)
  end 





end
