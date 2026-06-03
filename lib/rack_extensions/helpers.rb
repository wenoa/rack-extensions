module Rack
  module Test
    module Methods
      def post_json(url, body = {}, headers = {})
        post url, body.to_json, headers.merge({ "CONTENT_TYPE" => "application/json" })
        @last_resource_created = last_response.headers["location"]
      end

      def put_json(url, body, headers = {})
        put url, body.to_json, headers.merge({ "CONTENT_TYPE" => "application/json" })
      end

      def patch_json(url, body, headers = {})
        patch url, body.to_json, headers.merge({ "CONTENT_TYPE" => "application/json" })
      end

      def last_resource_created
        @last_resource_created
      end

      def last_resource_created_id
        last_resource_created.split("/").last
      end
    end
  end
end
