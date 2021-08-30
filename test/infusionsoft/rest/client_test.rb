# frozen_string_literal: true

require "test_helper"

class ClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Infusionsoft::REST::VERSION
  end

  def test_access_token
    client = Infusionsoft::REST::Client.new access_token: "test"
    assert_equal "test", client.access_token
  end
end
