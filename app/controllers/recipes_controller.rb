require 'csv'

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def search
    @result = Recipe.ask(search_params[:query])
    logger.info @result
    render :search_result
  end

  def show
    # Nothing to do now
  end

  def edit
    # Nothing to do now
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipe
    else
      render :new
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy!
    
    respond_to do |format|
      format.html { redirect_to recipes_path }
    end
  end

  def bulk_create
    csv_file = params[:csv_file]
    Recipe.bulk_create(csv_file)
    redirect_to recipes_path
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :description)
    end

    def search_params
      params.permit(:query)
    end
end
