require 'test_helper'

class HostTest < ActiveSupport::TestCase
  test 'uniqueness of hostname' do
    Host.create hostname: 'a', ip: '127.0.0.1'
    assert_raises Exception do
      Host.create! hostname: 'a', ip: '127.0.0.1'
    end
  end
end
