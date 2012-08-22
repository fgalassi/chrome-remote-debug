# Chrome Remote Debug

Ruby client library for the Google Chrome Remote Debugging Protocol.

## Usage

### Client Object

```ruby
# Initalize the client. Does not really connect.
chrome = ChromeRemoteDebug::Client.new("127.0.0.1", 9222)
# Fetch a list of pages returned as Page objects.
chrome.pages
```

### Page Object

```ruby
# Pages are ordered. This is the first tab in chrome.
page = chrome.pages[0]
# Title of the page
page.title
# Url of the page
page.url
# Favicon url of the page
page.favicon

# Refresh the page
page.reload
# Go to this url
page.navigate("http://www.google.com")
```

## Done

* Get page list
* Page.reload
* Page.navigate

## Todo

* All the rest of protocol v1.0

## Author

* Federico Galassi <federico.galassi@cleancode.it>
