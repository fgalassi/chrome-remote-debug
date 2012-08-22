require "json"
require_relative "../../vendor/web-socket-ruby/lib/web_socket"


module ChromeRemoteDebug
  class Page
    def initialize(spec)
      @spec = spec
    end

    def url
      @spec["url"]
    end

    def favicon
      @spec["faviconUrl"]
    end

    def title
      @spec["title"]
    end

    def reload
      ws = ::WebSocket.new(@spec["webSocketDebuggerUrl"])
      ws.send(JSON.generate(Command.new("Page.reload")))
      ws.close()
    end
  end
end
