# Chrome Remote Debug [![Build Status](https://secure.travis-ci.org/fgalassi/chrome-remote-debug.png)](http://travis-ci.org/fgalassi/chrome-remote-debug)

Ruby client library for the Google Chrome Remote Debugging Protocol.

## Requirements
- ruby >= 1.8.7
- *nix system (linux, mac os x, etc..), windows don't know.

## Install
```bash
$> gem install chrome_remote_debug
```

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
# Get the first page in chrome
page = chrome.pages.first
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

## License

- MIT License
- Copyright (c) 2012 Federico Galassi
