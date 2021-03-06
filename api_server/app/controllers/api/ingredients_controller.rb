class Api::IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show update destroy ]

  # GET /ingredients
  def index
    @ingredients = Ingredient.where(user_id: @user.id)

    render json: @ingredients
  end

  # GET /ingredients/1
  def show
    render json: @ingredient
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user_id = @user.id
    if @ingredient.save
      render json: @ingredient, status: :created
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    if @ingredient.update(ingredient_params)
      render json: @ingredient, status: :accepted
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ingredients/1
  def destroy
    if @ingredient.destroy
      render json: {"success": "Deleted"}, status: :see_other
    else
      render json: {"status": :internal_server_error}, status: :internal_server_error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :unit, :amount, :price, :store, :user_id)
    end
end
