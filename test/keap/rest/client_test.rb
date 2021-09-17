# frozen_string_literal: true

require "test_helper"

describe Keap::REST::Client do
  subject { Keap::REST::Client }

  it "has an access_token" do
    client = subject.new access_token: "test"
    _(client.access_token).must_equal "test"
  end
end
