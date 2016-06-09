require 'test_helper'

class BasicTest < ActionDispatch::IntegrationTest
  test "Check the test setup" do
    assert true
  end

  test "the root_path" do
    get root_path
    assert_instance_of DatabasesController, @controller
    assert_equal 'index', @controller.action_name
  end

  test "the basic layout" do
    get root_path
    assert_response :ok
    assert_select 'body > nav.ui.menu > a.item', "Home"
    assert_select 'body > main.ui.page.grid > .row > .column'
  end
end
