RSpec.describe("Rack::Test JSON helpers") {
  include Rack::Test::Methods

  let(:app) { EchoApp.new }

  describe("#post_json") {
    it("posts the body as JSON with the JSON content type") {
      post_json("/widgets", { name: "gadget" })

      expect(app.last_request[:method]).to(eq("POST"))
      expect(app.last_request[:path]).to(eq("/widgets"))
      expect(app.last_request[:content_type]).to(eq("application/json"))
      expect(app.last_request[:body]).to(eq('{"name":"gadget"}'))
    }

    it("can be called without a body") {
      post_json("/widgets")

      expect(app.last_request[:body]).to(eq("{}"))
    }

    it("merges the given headers with the content type") {
      post_json("/widgets", {}, { "HTTP_AUTHORIZATION" => "Bearer token" })

      expect(app.last_request[:auth]).to(eq("Bearer token"))
      expect(app.last_request[:content_type]).to(eq("application/json"))
    }

    it("captures the location of the created resource") {
      post_json("/widgets")

      expect(last_resource_created).to(eq("/widgets/42"))
    }
  }

  describe("#put_json") {
    it("puts the body as JSON with the JSON content type") {
      put_json("/widgets/1", { name: "gadget" })

      expect(app.last_request[:method]).to(eq("PUT"))
      expect(app.last_request[:path]).to(eq("/widgets/1"))
      expect(app.last_request[:content_type]).to(eq("application/json"))
      expect(app.last_request[:body]).to(eq('{"name":"gadget"}'))
    }

    it("merges the given headers with the content type") {
      put_json("/widgets/1", {}, { "HTTP_AUTHORIZATION" => "Bearer token" })

      expect(app.last_request[:auth]).to(eq("Bearer token"))
      expect(app.last_request[:content_type]).to(eq("application/json"))
    }
  }

  describe("#patch_json") {
    it("patches the body as JSON with the JSON content type") {
      patch_json("/widgets/1", { name: "gadget" })

      expect(app.last_request[:method]).to(eq("PATCH"))
      expect(app.last_request[:path]).to(eq("/widgets/1"))
      expect(app.last_request[:content_type]).to(eq("application/json"))
      expect(app.last_request[:body]).to(eq('{"name":"gadget"}'))
    }

    it("merges the given headers with the content type") {
      patch_json("/widgets/1", {}, { "HTTP_AUTHORIZATION" => "Bearer token" })

      expect(app.last_request[:auth]).to(eq("Bearer token"))
      expect(app.last_request[:content_type]).to(eq("application/json"))
    }
  }

  describe("#last_resource_created_id") {
    it("returns the last segment of the created resource location") {
      post_json("/widgets")

      expect(last_resource_created_id).to(eq("42"))
    }
  }
}
