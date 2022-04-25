require "test_helper"

class RecipeProceduresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_procedure = recipe_procedures(:one)
  end

  test "should get index" do
    get recipe_procedures_url, as: :json
    assert_response :success
  end

  test "should create recipe_procedure" do
    assert_difference("RecipeProcedure.count") do
      post recipe_procedures_url, params: { recipe_procedure: { content: @recipe_procedure.content, recipe_id: @recipe_procedure.recipe_id } }, as: :json
    end

    assert_response :created
  end

  test "should show recipe_procedure" do
    get recipe_procedure_url(@recipe_procedure), as: :json
    assert_response :success
  end

  test "should update recipe_procedure" do
    patch recipe_procedure_url(@recipe_procedure), params: { recipe_procedure: { content: @recipe_procedure.content, recipe_id: @recipe_procedure.recipe_id } }, as: :json
    assert_response :success
  end

  test "should destroy recipe_procedure" do
    assert_difference("RecipeProcedure.count", -1) do
      delete recipe_procedure_url(@recipe_procedure), as: :json
    end

    assert_response :no_content
  end
end
