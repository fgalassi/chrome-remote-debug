require "#{File.dirname(__FILE__)}/../lib/chrome_remote_debug.rb"

raise "ruby reload.rb localhost 9222" unless ARGV.count == 2

host = ARGV[0]
port = ARGV[1]

chrome = ChromeRemoteDebug::Client.new(ARGV[0], ARGV[1])
chrome.pages[0].reload
