require 'test_helper'

class OrderFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_food = order_foods(:one)
  end

  test "should get index" do
    get order_foods_url, as: :json
    assert_response :success
  end

  test "should create order_food" do
    assert_difference('OrderFood.count') do
      post order_foods_url, params: { order_food: { food_id: @order_food.food_id, order_id: @order_food.order_id, quantity: @order_food.quantity, status: @order_food.status } }, as: :json
    end

    assert_response 201
  end

  test "should show order_food" do
    get order_food_url(@order_food), as: :json
    assert_response :success
  end

  test "should update order_food" do
    patch order_food_url(@order_food), params: { order_food: { food_id: @order_food.food_id, order_id: @order_food.order_id, quantity: @order_food.quantity, status: @order_food.status } }, as: :json
    assert_response 200
  end

  test "should destroy order_food" do
    assert_difference('OrderFood.count', -1) do
      delete order_food_url(@order_food), as: :json
    end

    assert_response 204
  end
end
