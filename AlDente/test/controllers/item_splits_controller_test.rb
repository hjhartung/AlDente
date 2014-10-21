require 'test_helper'

class ItemSplitsControllerTest < ActionController::TestCase
  setup do
    @item_split = item_splits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_splits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_split" do
    assert_difference('ItemSplit.count') do
      post :create, item_split: { customer_id: @item_split.customer_id, details: @item_split.details, ordered_items_id: @item_split.ordered_items_id, percentage: @item_split.percentage }
    end

    assert_redirected_to item_split_path(assigns(:item_split))
  end

  test "should show item_split" do
    get :show, id: @item_split
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_split
    assert_response :success
  end

  test "should update item_split" do
    patch :update, id: @item_split, item_split: { customer_id: @item_split.customer_id, details: @item_split.details, ordered_items_id: @item_split.ordered_items_id, percentage: @item_split.percentage }
    assert_redirected_to item_split_path(assigns(:item_split))
  end

  test "should destroy item_split" do
    assert_difference('ItemSplit.count', -1) do
      delete :destroy, id: @item_split
    end

    assert_redirected_to item_splits_path
  end
end
