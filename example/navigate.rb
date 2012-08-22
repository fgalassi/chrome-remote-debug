require_relative "../lib/chrome_remote_debug.rb"

raise "ruby navigate.rb localhost 9222 http://www.google.com/" unless ARGV.count == 3

host = ARGV[0]
port = ARGV[1]
url =  ARGV[2]

chrome = ChromeRemoteDebug::Client.new(ARGV[0], ARGV[1])
chrome.pages[0].navigate(ARGV[2])
