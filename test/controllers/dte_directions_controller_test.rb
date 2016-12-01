require 'test_helper'

class DteDirectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dte_direction = dte_directions(:one)
  end

  test "should get index" do
    get dte_directions_url
    assert_response :success
  end

  test "should get new" do
    get new_dte_direction_url
    assert_response :success
  end

  test "should create dte_direction" do
    assert_difference('DteDirection.count') do
      post dte_directions_url, params: { dte_direction: { direction: @dte_direction.direction, direction_id: @dte_direction.direction_id, user_id: @dte_direction.user_id } }
    end

    assert_redirected_to dte_direction_url(DteDirection.last)
  end

  test "should show dte_direction" do
    get dte_direction_url(@dte_direction)
    assert_response :success
  end

  test "should get edit" do
    get edit_dte_direction_url(@dte_direction)
    assert_response :success
  end

  test "should update dte_direction" do
    patch dte_direction_url(@dte_direction), params: { dte_direction: { direction: @dte_direction.direction, direction_id: @dte_direction.direction_id, user_id: @dte_direction.user_id } }
    assert_redirected_to dte_direction_url(@dte_direction)
  end

  test "should destroy dte_direction" do
    assert_difference('DteDirection.count', -1) do
      delete dte_direction_url(@dte_direction)
    end

    assert_redirected_to dte_directions_url
  end
end
