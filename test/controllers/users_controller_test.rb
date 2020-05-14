require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select 'form.ui.form'
  end

  # Hint: attr_accessor :password
  test "should create user" do
    assert_difference('User.count') do
      post :create, params: { user: { email: @user.email, password: @user.password, username: @user.username } }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, params: { id: @user }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @user }
    assert_response :success
  end

  # Hint: attr_accessor :password
  test "should update user" do
    patch :update, params: { id: @user, user: { email: @user.email, password: @user.password, username: @user.username } }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, params: { id: @user }
    end

    assert_redirected_to users_path
  end

  test "shouldn't update user without a email" do
    patch :update, params: { id: @user, user: {email: "", username: @user.username} }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this user from being saved:"
    assert_select "li", "Email can't be blank"
  end

  test "shouldn't create without email" do
    post :create, params: { user: {email: nil, username: @user.username} }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this user from being saved:"
    assert_select "li", "Email can't be blank"
  end
end
