require "test_helper"

class ListItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list_item = list_items(:one)
  end

  test "should get index" do
    get list_items_url, as: :json
    assert_response :success
  end

  test "should create list_item" do
    assert_difference("ListItem.count") do
      post list_items_url, params: { list_item: { amount: @list_item.amount, ingredient_id: @list_item.ingredient_id } }, as: :json
    end

    assert_response :created
  end

  test "should show list_item" do
    get list_item_url(@list_item), as: :json
    assert_response :success
  end

  test "should update list_item" do
    patch list_item_url(@list_item), params: { list_item: { amount: @list_item.amount, ingredient_id: @list_item.ingredient_id } }, as: :json
    assert_response :success
  end

  test "should destroy list_item" do
    assert_difference("ListItem.count", -1) do
      delete list_item_url(@list_item), as: :json
    end

    assert_response :no_content
  end
end
