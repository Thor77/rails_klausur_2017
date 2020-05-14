require 'test_helper'

class DatabasesControllerTest < ActionController::TestCase
  setup do
    @database = databases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:databases)
    assert_select 'table.ui.table'
  end

  test 'index contains hosts' do
    get :index
    assert_select 'td > ul' do
      @database.hosts.each do |host|
        assert_select "li > a[href='#{host_path(host)}']", host.hostname
      end
    end
  end

  test 'index contains users' do
    get :index
    assert_select 'th', "Users"
    @database.users.each do |user|
      assert_select "td > ul > li a[href='#{user_path(user)}']", user.username
    end
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select 'form.ui.form'
  end

  test "form contains new_host_path link" do
    get :new
    assert_select "a.ui.button[href='#{new_host_path}']", "New Host"
  end

  test 'form contains a new_user_path link' do
    get :new
    assert_select "a.ui.button[href='#{new_user_path}']", "New User"
  end

  test "should create database" do
    assert_difference('Database.count') do
      post :create, params: { database: { description: @database.description, name: @database.name } }
    end

    assert_redirected_to database_path(assigns(:database))
  end

  # Hint: collection_check_boxes
  test 'the form shows collection_check_boxes for Hosts' do
    get :edit, params: { id: @database }
    assert_select '.field' do
      assert_select 'label[for="database_host_ids"]', "Hosts"
      assert_select 'input[name="database[host_ids][]"]'
    end
  end

  # Hint: collection_check_boxes
  test 'the form shows collection_check_boxes for Users' do
    get :edit, params: { id: @database }
    assert_select '.field' do
      assert_select 'label[for="database_user_ids"]', "Give access to users"
      assert_select 'input[name="database[user_ids][]"]'
    end
  end

  test "should show database" do
    get :show, params: { id: @database }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @database }
    assert_response :success
    assert_select 'form.ui.form'
  end

  test "should update database" do
    patch :update, params: { id: @database, database: {description: @database.description, name: @database.name} }
    assert_redirected_to database_path(assigns(:database))
  end

  test "Should update database with users and hosts" do
    patch :update, params: { id: @database, database: {description: @database.description, name: @database.name, host_ids: [hosts(:one).id], user_ids: [users(:one).id]} }
    assert_redirected_to database_path(assigns(:database))
    assert_equal [hosts(:one).id], assigns(:database).host_ids
    assert_equal [users(:one).id], assigns(:database).user_ids
  end

  test "should destroy database" do
    assert_difference('Database.count', -1) do
      delete :destroy, params: { id: @database }
    end

    assert_redirected_to databases_path
  end

  test "shouldn't update database without a name" do
    patch :update, params: { id: @database, database: {name: nil} }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this database from being saved:"
    assert_select "li", "Name can't be blank"
  end

  test "shouldn't create without name" do
    post :create, params: { database: { name: nil } }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this database from being saved:"
    assert_select "li", "Name can't be blank"
  end
end
