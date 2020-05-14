require 'test_helper'

class EnvironmentsControllerTest < ActionController::TestCase
  setup do
    @environment = environments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:environments)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select 'form.ui.form'
  end

  test "should create environment" do
    assert_difference('Environment.count') do
      post :create, params: { environment: {name: @environment.name} }
    end

    assert_redirected_to environment_path(assigns(:environment))
  end

  test "should show environment" do
    get :show, params: { id: @environment }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @environment }
    assert_response :success
  end

  test "should update environment" do
    patch :update, params: { id: @environment, environment: {name: @environment.name} }
    assert_redirected_to environment_path(assigns(:environment))
  end

  test "should destroy environment" do
    assert_difference('Environment.count', -1) do
      delete :destroy, params: { id: @environment }
    end

    assert_redirected_to environments_path
  end

  test "shouldn't update environment without a name" do
    patch :update, params: { id: @environment, environment: {name: nil} }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this environment from being saved:"
    assert_select "li", "Name can't be blank"
  end

  test "shouldn't create without name" do
    post :create, params: { environment: {name: nil} }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this environment from being saved:"
    assert_select "li", "Name can't be blank"
  end
end
