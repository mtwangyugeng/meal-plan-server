class Api::RecipeProceduresController < ApplicationController
  before_action :set_recipe_procedure, only: %i[ update destroy ]

  # GET /recipe_procedures
  def index
    @recipe_procedures = RecipeProcedure.all

    render json: @recipe_procedures
  end

  # GET /recipe_procedures/1
  def show
    @recipe_procedures = RecipeProcedure.where(recipe_id: params[:id])
    render json: @recipe_procedures
  end

  # POST /recipe_procedures
  def create
    @recipe_procedure = RecipeProcedure.new(recipe_procedure_params)

    if @recipe_procedure.save
      render json: @recipe_procedure, status: :created
    else
      render json: @recipe_procedure.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipe_procedures/1
  def update
    if @recipe_procedure.update(recipe_procedure_params)
      render json: @recipe_procedure, status: :accepted
    else
      render json: @recipe_procedure.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipe_procedures/1
  def destroy
    if @recipe_procedure.destroy
      render json: {"success": "Deleted"}, status: :see_other
    else
      render json: {"status": :internal_server_error}, status: :internal_server_error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_procedure
      @recipe_procedure = RecipeProcedure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_procedure_params
      params.require(:recipe_procedure).permit(:recipe_id, :content)
    end
end
