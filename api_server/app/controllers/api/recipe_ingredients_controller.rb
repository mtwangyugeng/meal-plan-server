class Api::RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: %i[ update destroy ]

  # GET /recipe_ingredients
  def index
    @recipe_ingredients = RecipeIngredient.all

    render json: @recipe_ingredients
  end

  # GET /recipe_ingredients/1
  def show
    @recipe_ingredients = RecipeIngredient.where(recipe_id: params[:id])

    render json: @recipe_ingredients
  end

  # POST /recipe_ingredients
  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)

    if @recipe_ingredient.save
      render json: @recipe_ingredient, status: :created
    else
      render json: @recipe_ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipe_ingredients/1
  def update
    if @recipe_ingredient.update(recipe_ingredient_params)
      render json: @recipe_ingredient, status: :accepted
    else
      render json: @recipe_ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipe_ingredients/1
  def destroy
    if @recipe_ingredient.destroy
      render json: {"success": "Deleted"}, status: :see_other
    else
      render json: {"status": :internal_server_error}, status: :internal_server_error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_ingredient
      @recipe_ingredient = RecipeIngredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_ingredient_params
      params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :amount)
    end
end
