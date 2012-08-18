require_relative "../lib/chrome_remote_debug.rb"
require "webmock/rspec"

# force expect syntax
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
