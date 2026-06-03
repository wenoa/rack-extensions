require "rack"

class EchoApp
  attr_reader :last_request

  def call(env)
    request = Rack::Request.new(env)
    @last_request = {
      method: request.request_method,
      path: request.path,
      content_type: request.content_type,
      auth: request.get_header("HTTP_AUTHORIZATION"),
      body: request.body.read,
    }

    if request.post?
      [201, { "location" => "/widgets/42" }, ["created"]]
    else
      [200, {}, ["ok"]]
    end
  end
end
