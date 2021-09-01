require "test_helper"

class AccountResourceTest < Minitest::Test
  def test_info
    stub = stub_request("account/profile", response: stub_response(fixture: "account/info"))
    client = Infusionsoft::REST::Client.new(access_token: "fake", adapter: :test, stubs: stub)
    account = client.account.info

    assert_equal Infusionsoft::REST::Account, account.class
    assert_equal "admin@example.com", account.email
  end

  def test_update
  end
end
