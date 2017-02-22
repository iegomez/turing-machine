require 'test_helper'

class TransitionsControllerTest < ActionController::TestCase
  setup do
    @transition = transitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transition" do
    assert_difference('Transition.count') do
      post :create, transition: { direction: @transition.direction, in_char: @transition.in_char, in_state: @transition.in_state, out_char: @transition.out_char, out_state: @transition.out_state }
    end

    assert_redirected_to transition_path(assigns(:transition))
  end

  test "should show transition" do
    get :show, id: @transition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transition
    assert_response :success
  end

  test "should update transition" do
    patch :update, id: @transition, transition: { direction: @transition.direction, in_char: @transition.in_char, in_state: @transition.in_state, out_char: @transition.out_char, out_state: @transition.out_state }
    assert_redirected_to transition_path(assigns(:transition))
  end

  test "should destroy transition" do
    assert_difference('Transition.count', -1) do
      delete :destroy, id: @transition
    end

    assert_redirected_to transitions_path
  end
end
