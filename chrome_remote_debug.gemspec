Gem::Specification.new do |s|
  s.name        = "chrome_remote_debug"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Federico Galassi"]
  s.email       = ["federico.galassi@cleancode.it"]
  s.homepage    = "http://github.com/fgalassi/chrome-remote-debug"
  s.summary     = "Ruby client library for the Google Chrome Remote Debugging Protocol."
  s.description = s.summary

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "webmock"

  s.add_runtime_dependency "json"

  s.files         = Dir["lib/**/*.rb", "vendor/**/lib/*.rb"]
  s.test_files    = Dir["spec/**/*"]
  s.require_paths = ["lib"]
end
