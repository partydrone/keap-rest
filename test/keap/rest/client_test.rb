require "test_helper"

describe Keap::REST::Client do
  subject { Keap::REST::Client }

  before do
    Keap::REST.reset!
  end

  after do
    Keap::REST.reset!
  end

  describe "module configuration" do
    before do
      Keap::REST.reset!
      Keap::REST.configure do |config|
        Keap::REST::Configurable.keys.each do |key|
          config.send("#{key}=", "Some #{key}")
        end
      end
    end

    after do
      Keap::REST.reset!
    end

    it "inherits the module configuration" do
      client = subject.new

      Keap::REST::Configurable.keys.each do |key|
        _(client.instance_variable_get(:"@#{key}")).must_equal "Some #{key}"
      end
    end

    describe "with class-level configuration" do
      before do
        @options = {
          access_token: "some-new-access_token",
          authorize_url: "https://api.bogus.zzz/auth"
        }
      end

      it "overrides module configuration" do
        client = subject.new(@options)

        _(client.access_token).must_equal "some-new-access_token"
        _(client.authorize_url).must_equal "https://api.bogus.zzz/auth"
        _(client.token_url).must_equal Keap::REST.token_url
      end

      it "can set configuration after initialization" do
        client = subject.new
        client.configure do |config|
          @options.each do |key, value|
            config.send("#{key}=", value)
          end
        end

        _(client.access_token).must_equal "some-new-access_token"
        _(client.authorize_url).must_equal "https://api.bogus.zzz/auth"
        _(client.token_url).must_equal Keap::REST.token_url
      end

      it "masks tokens on inspect" do
        client = subject.new(access_token: "OPExnRuUZtQe6I9QtSNY5j5BrrnU")
        inspected = client.inspect
        _(inspected).wont_include "OPExnRuUZtQe6I9QtSNY5j5BrrnU"
      end

      it "masks client_secret on inspect" do
        client = subject.new(client_secret: "lTQGNuoaYMLwFO9r")
        inspected = client.inspect
        _(inspected).wont_include "lTQGNuoaYMLwFO9r"
      end
    end
  end

  describe ".last_response" do
    it "caches the last agent response" do
      Keap::REST.reset!
      stub = stub_request(:get, "account/profile", response: stub_response(fixture: "account/info"))
      client = subject.new(access_token: "fake", adapter: :test, stubs: stub)

      _(client.last_response).must_be_nil

      client.account

      _(client.last_response.status).must_equal 200
    end
  end

  describe ".get" do
    before do
      Keap::REST.reset!
    end

    it "handles query params" do
      # stub = stub_request(:get, "account/profile", response: stub_response(fixture: "account/info"))
    end
  end

  describe "error handling" do
    it "raises on 400" do
      stub = stub_request(:get, "whatever", response: stub_response(status: 400, fixture: "errors/400"))
      client = subject.new(access_token: "fake", adapter: :test, stubs: stub)

      _ { client.connection.get("whatever") }.must_raise Keap::REST::BadRequest
    end

    it "raises on 401" do
      stub = stub_request(:get, "who_are_you", response: stub_response(status: 401, fixture: "errors/401"))
      client = subject.new(access_token: "fake", adapter: :test, stubs: stub)

      _ { client.connection.get("who_are_you") }.must_raise Keap::REST::Unauthorized
    end

    it "raises on 403" do
      stub = stub_request(:get, "nope", response: stub_response(status: 403, fixture: "errors/403"))
      client = subject.new(access_token: "fake", adapter: :test, stubs: stub)

      _ { client.connection.get("nope") }.must_raise Keap::REST::Forbidden
    end

    it "raises on 404" do
      stub = stub_request(:get, "what", response: stub_response(status: 404, fixture: "errors/404"))
      client = subject.new(access_token: "fake", adapter: :test, stubs: stub)

      _ { client.connection.get("what") }.must_raise Keap::REST::NotFound
    end

    it "raises on 422" do
      stub = stub_request(:get, "say_again", response: stub_response(status: 422, fixture: "errors/422"))
      client = subject.new(access_token: "fake", adapter: :test, stubs: stub)

      _ { client.connection.get("say_again") }.must_raise Keap::REST::UnprocessableEntity
    end

    it "raises on 500" do
      stub = stub_request(:get, "boom", response: stub_response(status: 500, fixture: "errors/500"))
      client = subject.new(access_token: "fake", adapter: :test, stubs: stub)

      _ { client.connection.get("boom") }.must_raise Keap::REST::InternalServerError
    end

    it "raises on 503" do
      stub = stub_request(:get, "hmm", response: stub_response(status: 503, fixture: "errors/503"))
      client = subject.new(access_token: "fake", adapter: :test, stubs: stub)

      _ { client.connection.get("hmm") }.must_raise Keap::REST::ServiceUnavailable
    end
  end
end
