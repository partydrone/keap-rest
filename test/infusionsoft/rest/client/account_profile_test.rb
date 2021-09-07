require "test_helper"

class AccountProfileTest < Minitest::Test
  def test_account_profile
    stub = stub_request("account/profile", response: stub_response(fixture: "account/info"))
    client = Infusionsoft::REST::Client.new(access_token: "fake", adapter: :test, stubs: stub)
    account = client.account_profile

    assert_equal Infusionsoft::REST::AccountProfile, account.class
    assert_equal "admin@example.com", account.email
  end

  def test_update_account_profile
  end
end
