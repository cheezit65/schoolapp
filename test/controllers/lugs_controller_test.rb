require 'test_helper'

class LugsControllerTest < ActionController::TestCase
  setup do
    @lug = lugs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lugs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lug" do
    assert_difference('Lug.count') do
      post :create, lug: { post: @lug.post, title: @lug.title }
    end

    assert_redirected_to lug_path(assigns(:lug))
  end

  test "should show lug" do
    get :show, id: @lug
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lug
    assert_response :success
  end

  test "should update lug" do
    patch :update, id: @lug, lug: { post: @lug.post, title: @lug.title }
    assert_redirected_to lug_path(assigns(:lug))
  end

  test "should destroy lug" do
    assert_difference('Lug.count', -1) do
      delete :destroy, id: @lug
    end

    assert_redirected_to lugs_path
  end
end
