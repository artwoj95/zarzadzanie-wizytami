require 'test_helper'

class CustomerInfosControllerTest < ActionController::TestCase
  setup do
    @customer_info = customer_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_info" do
    assert_difference('CustomerInfo.count') do
      post :create, customer_info: {  }
    end

    assert_redirected_to customer_info_path(assigns(:customer_info))
  end

  test "should show customer_info" do
    get :show, id: @customer_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_info
    assert_response :success
  end

  test "should update customer_info" do
    patch :update, id: @customer_info, customer_info: {  }
    assert_redirected_to customer_info_path(assigns(:customer_info))
  end

  test "should destroy customer_info" do
    assert_difference('CustomerInfo.count', -1) do
      delete :destroy, id: @customer_info
    end

    assert_redirected_to customer_infos_path
  end
end
