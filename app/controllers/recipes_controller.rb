class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    logger.info params
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipe
    else
      render :new
    end
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to recipes_path }
    end
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :description)
    end
end
