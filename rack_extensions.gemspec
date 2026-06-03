require_relative "lib/rack_extensions/version"

Gem::Specification.new { |spec|
  spec.name = "rack_extensions"
  spec.version = RackExtensions::VERSION
  spec.authors = ["Wenoa Studio"]
  spec.email = ["desarrollo@wenoa.studio"]

  spec.summary = "Reusable Rack::Test helpers by Wenoa."
  spec.description = spec.summary
  spec.homepage = "https://github.com/wenoa/rack-extensions"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4"

  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rack-test", "~> 2.2"
}
