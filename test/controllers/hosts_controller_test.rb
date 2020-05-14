require 'test_helper'

class HostsControllerTest < ActionController::TestCase
  setup do
    @host = hosts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hosts)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select 'form.ui.form'
  end

  test 'shows new_environment_path next to the environment select' do
    get :new
    assert_select "select#host_environment + a.ui.button[href='#{new_environment_path}']", "New Environment"
  end

  test "should create host" do
    assert_difference('Host.count') do
      post :create, params: { host: {environment_id: @host.environment_id, hostname: @host.hostname+'1', ip: @host.ip.next, operating_system: @host.operating_system} }
    end

    assert_redirected_to host_path(assigns(:host))
  end

  test "should show host" do
    get :show, params: { id: @host }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @host }
    assert_response :success
  end

  test "should update host" do
    patch :update, params: { id: @host, host: {environment_id: @host.environment_id, hostname: @host.hostname+'1', ip: @host.ip.next, operating_system: @host.operating_system} }
    assert_redirected_to host_path(assigns(:host))
  end

  test "should destroy host" do
    assert_difference('Host.count', -1) do
      delete :destroy, params: { id: @host }
    end

    assert_redirected_to hosts_path
  end

  # Hier ist der reguläre Ausdruck für die Validierung der IP-Adresse
  #     \A(?:[0-9]{1,3}\.){3}[0-9]{1,3}\z
  test "shouldn't update host with an invalid IP" do
    patch :update, params: { id: @host, host: { ip: "invalid", hostname: '2' } }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this host from being saved:"
    assert_select "li", "Ip is invalid"
  end

  test "shouldn't create with an invalid IP" do
    post :create, params: { host: { name: nil } }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this host from being saved:"
    assert_select "li", "Ip is invalid"
  end
end
