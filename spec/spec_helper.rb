require "simplecov"
require "simplecov-console"

if ENV["COVERAGE"]
  SimpleCov.start {
    enable_coverage :branch
  }
end

require "json"
require_relative "../lib/rack_extensions"
require_relative "support/echo_app"
