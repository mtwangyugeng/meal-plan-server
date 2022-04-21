class Api::ListItemsController < ApplicationController
  before_action :set_list_item, only: %i[ show update destroy ]

  # GET /list_items
  def index
    @list_items = ListItem.where(user_id: @user.id)

    render json: @list_items
  end

  # GET /list_items/1
  def show
    render json: @list_item
  end

  # POST /list_items
  def create
    @list_item = ListItem.new(list_item_params)
    @list_item.user_id = @user.id
    if @list_item.save
      render json: @list_item, status: :created
    else
      render json: @list_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /list_items/1
  def update
    if @list_item.update(list_item_params)
      render json: @list_item, status: :accepted
    else
      render json: @list_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /list_items/1
  def destroy
    if @list_item.destroy
      render json: {"success": "Deleted"}, status: :see_other
    else
      render json: {"status": :internal_server_error}, status: :internal_server_error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = ListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_item_params
      params.require(:list_item).permit(:ingredient_id, :amount, :user_id)
    end
end
