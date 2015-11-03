require 'test_helper'

class LinaItemsControllerTest < ActionController::TestCase
  setup do
    @lina_item = lina_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lina_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lina_item" do
    assert_difference('LinaItem.count') do
      post :create, lina_item: { cart_id: @lina_item.cart_id, product_id: @lina_item.product_id }
    end

    assert_redirected_to lina_item_path(assigns(:lina_item))
  end

  test "should show lina_item" do
    get :show, id: @lina_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lina_item
    assert_response :success
  end

  test "should update lina_item" do
    patch :update, id: @lina_item, lina_item: { cart_id: @lina_item.cart_id, product_id: @lina_item.product_id }
    assert_redirected_to lina_item_path(assigns(:lina_item))
  end

  test "should destroy lina_item" do
    assert_difference('LinaItem.count', -1) do
      delete :destroy, id: @lina_item
    end

    assert_redirected_to lina_items_path
  end
end
